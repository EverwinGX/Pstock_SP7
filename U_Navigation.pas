unit U_Navigation;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    fcTreeView, Shader, StdCtrls, GradientLabel, ExtCtrls, Db, DBTables,
    wwstorep, ComCtrls, SHELLAPI, Menus, AdvMenus, ADODB, uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  uADCompDataSet, uADCompClient;

type
    TF_Nav = class(TForm)
        Panel2: TPanel;
        Panel4: TPanel;
        Button1: TButton;
        GradientLabel3: TGradientLabel;
        Shader3: TShader;
        tv_niveau: TfcTreeView;
        pln_niveauGauche: TPanel;
        pln_niveauDroit: TPanel;
        Timer1: TTimer;
    Popup_Niveau: TAdvPopupMenu;
    DvelopperTout1: TMenuItem;
    RduireTout1: TMenuItem;
    sp_Niveau: TADStoredProc;
        procedure MAJ_Arbre_Niveau;
        procedure Explore_Child(curNode: TfcTreeNode; N_Noeud: string);
        procedure tv_niveauMouseDown(TreeView: TfcCustomTreeView;
            Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
            Y: Integer);
        function Informe_Noeud(N_Noeud, N_Noeud_Parent: string; Action, Expand, Mode, Actuel: string): string;
        function Recup_Infos_Noeud(Infos: string; Rech: integer): string;
        function init: integer;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CreateParams(var Params: TCreateParams); override;
        procedure Timer1Timer(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormResize(Sender: TObject);
        procedure Exec_Action(Href: string);
        procedure tv_niveauDblClick(TreeView: TfcCustomTreeView;
            Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
            Y: Integer);
    procedure DvelopperTout1Click(Sender: TObject);
    procedure RduireTout1Click(Sender: TObject);
    private
        Noeud_Niveau_Sel: TfcTreeNode;
        N_Noeud_Niveau_Sel: string;
        Noeud_Trouve: TfcTreeNode;
        Text_Noeud_Niveau: string;
        Mem_Niveau_Sel: integer;
        Mem_N_lst_detail_Sel: string;
        Fin_Chargement_Listes_Detail: boolean;
        Fin_Chargement_Niveau: boolean;
        Info_actif: boolean;

    public
        Timer: integer;
        ApplicationHandle: integer;
    end;

var
    F_Nav: TF_Nav;

implementation

uses MAIN, U_Info, U_Params;

{$R *.DFM}

procedure TF_Nav.CreateParams(var Params: TCreateParams);
begin
    //permet l'affichage en avant par surcharge de la procedure createparams
    inherited CreateParams(Params);

    if Form1.Param_Top_Most = 1 then
    begin
        with Params do begin
            ExStyle := ExStyle or WS_EX_TOPMOST;
            WndParent := GetDesktopwindow;
        end;
    end
    else
    begin
        with Params do begin
            //ExStyle := ExStyle or WS_EX_TOPMOST ;
            WndParent := GetDesktopwindow;
        end;
    end;

end;

procedure TF_Nav.MAJ_Arbre_Niveau;
var CurNode, ChildNode1: TfcTreeNode;
    strNom: string;
    Noeud_Parent: string;
    N_Noeud: string;
    strAction: string;
    strExpand: string;
    strMode: string;
    strActuel: string;
    intImage_index: integer;
    intSelected_index: integer;
    intSate_index: integer;
    Tmp_Parent: string;
    n: integer;
label Suite;
begin
    Fin_Chargement_Niveau := False;

    for n := tv_niveau.Items.Count - 1 downto 0 do
    begin
        tv_niveau.Items[n].Delete;
    end;

     //Sélectionne le premier noeud
    sp_Niveau.first;
    while not sp_Niveau.Eof do
    begin
        Noeud_Trouve := nil;
     //Récupère la clé de la table
        N_Noeud := sp_Niveau.fieldbyname('lst_detail').asstring;
     //Récupère le parent de la table
        Noeud_Parent := sp_Niveau.fieldbyname('lst_Detail_Parent').asstring;
     //Récupère le descriptif de la table
        strNom := sp_Niveau.fieldbyname('Libelle').asstring;
     //Récupère l'image index
        intImage_index := sp_Niveau.fieldbyname('ImgIndex').asinteger;
     //Récupère l'image index
        intSelected_index := sp_Niveau.fieldbyname('ImgIndex_Sel').asinteger;
     //Récupère l'action
        strAction := sp_Niveau.fieldbyname('Action').asstring;
     //Récupère l'action
        strExpand := sp_Niveau.fieldbyname('Expand').asstring;
     //Récupère l'action
        strMode := '';
     //Récupère l'action
        strActuel := sp_Niveau.fieldbyname('Actuel').asstring;

        if (Noeud_Parent = '-1') then begin
         //Applique les propriétés au noeud
            CurNode := tv_niveau.Items.add(nil, strNom);
            CurNode.StringData := Informe_Noeud(N_Noeud, Noeud_Parent, strAction, strExpand, strMode, strActuel);
            CurNode.ImageIndex := intImage_index;
            CurNode.SelectedIndex := intSelected_index;
            CurNode.StateIndex := -1;
            Curnode.StringData2 := N_Noeud;
        end
        else begin
            with tv_niveau do begin
                curNode := Items.GetFirstNode;
                if not (curNode = nil) then
                begin
                    repeat
                        tmp_Parent := Recup_Infos_Noeud(curNode.stringdata, 0);
                        if not (tmp_Parent = Noeud_Parent) then begin
                            Explore_Child(curNode, Noeud_Parent);
                            ChildNode1 := tv_niveau.Items.addchild(Noeud_Trouve, strNom);
                            ChildNode1.StringData := Informe_Noeud(N_Noeud, Noeud_Parent, strAction, strExpand, strMode, strActuel);
                            ChildNode1.ImageIndex := intImage_index;
                            ChildNode1.SelectedIndex := intSelected_index;
                            ChildNode1.StateIndex := -1;
                            ChildNode1.StringData2 := N_Noeud;
                            goto Suite;
                        end
                        else begin
                            curNode := tv_niveau.Items.addchild(curNode, strNom);
                            curNode.StringData := Informe_Noeud(N_Noeud, Noeud_Parent, strAction, strExpand, strMode, strActuel);
                            CurNode.ImageIndex := intImage_index;
                            Curnode.SelectedIndex := intSelected_index;
                            CurNode.StateIndex := -1;
                            Curnode.StringData2 := N_Noeud;
                            goto Suite;
                        end;
                        curNode := curNode.GetNextSibling;
                    until curNode = nil;
                    if (curNode = nil) then
                    begin
                     //Applique les propriétés au noeud
                        CurNode := tv_niveau.Items.add(nil, strNom);
                        CurNode.StringData := Informe_Noeud(N_Noeud, Noeud_Parent, strAction, strExpand, strMode, strActuel);
                        CurNode.ImageIndex := intImage_index;
                        CurNode.SelectedIndex := intSelected_index;
                        CurNode.StateIndex := -1;
                        Curnode.StringData2 := N_Noeud;
                    end;
                end
                else
                begin
                //Applique les propriétés au noeud
                    CurNode := tv_niveau.Items.add(nil, strNom);
                    CurNode.StringData := Informe_Noeud(N_Noeud, Noeud_Parent, strAction, strExpand, strMode, strActuel);
                    CurNode.ImageIndex := intImage_index;
                    CurNode.SelectedIndex := intSelected_index;
                    CurNode.StateIndex := -1;
                    Curnode.StringData2 := N_Noeud;
                end;
            end;
        end;


        Suite:
        sp_Niveau.next;
    end;
    Fin_Chargement_Niveau := true;
end;

procedure TF_Nav.Explore_Child(curNode: TfcTreeNode; N_Noeud: string);
var Tmp_Noeud: string;
    ChildNode1: TfcTreeNode;
begin
    if not (Noeud_Trouve = nil) then Exit;
    ChildNode1 := curNode.GetFirstChild;
    if not (ChildNode1 = nil) then begin
        repeat
            Tmp_Noeud := (Recup_Infos_Noeud(ChildNode1.stringdata, 0));
            if not (Tmp_Noeud = N_Noeud) then begin
                Explore_Child(ChildNode1, N_Noeud);
                ChildNode1 := ChildNode1.GetNextSibling;
            end
            else begin
                Noeud_Trouve := ChildNode1;
                exit;
            end;
        until ChildNode1 = nil;
    end;
end;

procedure TF_Nav.tv_niveauMouseDown(TreeView: TfcCustomTreeView;
    Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
    Y: Integer);

var retour: integer;
    Action, Mode: string;
begin
    if timer1.Enabled = True then
    begin
        timer1.Enabled := False;
        timer1.Interval := Timer;
        timer1.Enabled := True;

    end;
    if (not (Node = nil)) then begin
        Noeud_niveau_Sel := Node;
        Noeud_niveau_Sel.Selected := true;
        Noeud_niveau_Sel.Focused := true;
        N_Noeud_niveau_sel := Recup_Infos_Noeud(Noeud_niveau_Sel.stringdata, 0);
        mem_Niveau_sel := Noeud_niveau_Sel.Level;
        mem_N_lst_detail_sel := Noeud_niveau_Sel.stringdata2;

       // if Noeud_niveau_Sel.HasChildren = true then
       //     Noeud_niveau_Sel.Expand(False);
    end;

end;


//***********************************************************
//* Informe_Noeud
//* Fonction pour concatener les informations à stocker
//***********************************************************

function TF_Nav.Informe_Noeud(N_Noeud, N_Noeud_Parent: string; Action, Expand, Mode, Actuel: string): string;
var
    strN_Noeud: string;
    strN_Noeud_Parent: string;
    strAction: string;
    strExpand: string;
    strMode: string;
    strActuel: string;
begin
    strN_Noeud := '{' + N_Noeud + '} ';
    strN_Noeud_Parent := '{' + N_Noeud_Parent + '} ';
    strAction := '{' + Action + '} ';
    strExpand := '{' + Expand + '} ';
    strMode := '{' + Mode + '} ';
    strActuel := '{' + Actuel + '} ';

    Informe_Noeud := strN_Noeud + strN_Noeud_Parent + strAction + strExpand + strMode + strActuel;
end;

//***********************************************************
//* Recup_Infos_Noeud
//* Fonction pour récupérer les informations stockées
//***********************************************************

function TF_Nav.Recup_Infos_Noeud(Infos: string; Rech: integer): string;
var
    Donnees: array of string;
    Index: integer;
    Rec1: integer;
    Rec2: integer;
begin
   //Déclaration de la longueur du tableau
    SetLength(Donnees, 6);
    Index := 5;

    Rec1 := LastDelimiter('{', Infos);
    Rec2 := LastDelimiter('}', Infos);
    while Rec1 > 0 do
    begin
        Donnees[Index] := Copy(Infos, Rec1 + 1, Rec2 - Rec1 - 1);
        Delete(Infos, Rec1, Rec2 - Rec1 + 1);
        Rec1 := LastDelimiter('{', Infos);
        Rec2 := LastDelimiter('}', Infos);
        Index := Index - 1;
    end;
    Recup_Infos_Noeud := Donnees[Rech];
end;


//***********************************************************
//* tv_ExplorChange
//* Changement de la sélection d'un noeud
//***********************************************************

function TF_Nav.init: integer;
var i: integer;
begin
    if Timer > 0 then
    begin
        Timer1.Interval := Timer;
        Timer1.Enabled := True;
    end;


    HEight := sp_niveau.FieldByName('Height').asinteger;
    Width := sp_niveau.FieldByName('Width').asinteger;
    Caption := sp_niveau.FieldByName('Caption').asstring;
    tv_niveau.Color := sp_niveau.FieldByName('ColorFond').asinteger;

    MAJ_Arbre_Niveau;

    for i := 0 to tv_niveau.Items.Count - 1 do
    begin
        if Recup_Infos_Noeud(tv_niveau.items[i].stringdata, 5) = 'Oui' then
        begin
            Noeud_niveau_Sel := tv_niveau.items[i];
            Noeud_niveau_Sel.Selected := true;
            Noeud_niveau_Sel.Focused := true;
            N_Noeud_niveau_sel := Recup_Infos_Noeud(Noeud_niveau_Sel.stringdata, 0);
            mem_Niveau_sel := Noeud_niveau_Sel.Level;
            mem_N_lst_detail_sel := Noeud_niveau_Sel.stringdata2;
        end;
        if Recup_Infos_Noeud(tv_niveau.items[i].stringdata, 3) = 'Oui' then
        begin
            if tv_niveau.items[i].HasChildren then
                tv_niveau.items[i].expand(false);
        end;
    end;
end;

procedure TF_Nav.FormClose(Sender: TObject; var Action: TCloseAction);
var i: integer;
begin

    Fin_Chargement_Niveau := False;
    for I := tv_niveau.Items.Count - 1 downto 0 do
        tv_niveau.Items[i].Delete;


    for I := 0 to ComponentCount - 1 do
        if (Components[I] is TDataSet) and ((Components[i] as TDataSet).Active = True) then
            (Components[i] as TDataSet).Close;

end;

procedure TF_Nav.Timer1Timer(Sender: TObject);
begin
    Modalresult := MrCancel;
end;

procedure TF_Nav.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (ssAlt in Shift) and (Info_actif = False) then
    begin
        Info_actif := true;
        F_Info := Tf_info.create(F_params);
        F_info.lbl_hauteur.caption := inttostr(F_params.height);
        F_info.lbl_largeur.caption := inttostr(F_params.Width);
        F_info.Show;
    end;
end;

procedure TF_Nav.FormKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (ssAlt in Shift) then
    begin
        Info_actif := False;
        if F_Info <> nil then
        begin
            F_Info.Free;
        end;
    end;
end;

procedure TF_Nav.FormResize(Sender: TObject);
begin
    if (Info_actif = true) and (F_Info <> nil) then
    begin
        F_info.lbl_hauteur.caption := inttostr(height);
        F_info.lbl_largeur.caption := inttostr(Width);

    end;
end;

procedure TF_Nav.Exec_Action(Href: string);
var
    Recup_handle: THandle;
    FExe, FParametres: string;
    Raccourci, P, P_Act, PF, TypeFiche, NFiche: integer;
    WM_OPEN: integer;
    Action: string;
    Nom_param: string;
    i: integer;
begin

    FExe := href;
    FParametres := '';
    raccourci := strToIntDef(href, 0);

    P := pos('ouvrir_fiche_genesys_', href);
    if (P > 0) then
    begin
        P_act := pos('[', href);
        TypeFiche := StrToIntDef(Copy(href, P + length('ouvrir_fiche_genesys_'), 3), 0);
        //Si l'action est après la commande ouverture
        if (P_act > 0) and (P_act > P) then
        begin
            NFiche := StrToIntDef(Copy(href, P + length('ouvrir_fiche_genesys_') + 3, (P_act) - (P + length('ouvrir_fiche_genesys_') + 3)), 0);
        end
        else
        begin
            NFiche := StrToIntDef(Copy(href, P + length('ouvrir_fiche_genesys_') + 3, 10), 0);
        end;

        if (TypeFiche = 0) or (NFiche = 0) then
        begin
        end
        else
        begin
            try
                Form1.Voir_Fiche(NFiche, TypeFiche);
            finally
            end;
        end;

        //Recherche d'une action potentiel
        P := pos('[', href);
        PF := pos(']', href);
        if (P > 0) and (PF > 0) then
        begin
            Action := copy(href, P + 1, PF - (P + 1));
        end;
    end
    else
    begin
        P := pos('<', href);
        if (P > 0) then
        begin
            FExe := Copy(href, 1, P - 1);
            FParametres := Copy(href, P + 1, length(href) - (P));
        end
        else
        begin
            FExe := href;
            FParametres := '';
        end;


        FParametres := StringReplace(FParametres, '<', '', []);
        FParametres := StringReplace(FParametres, '$USER', IntToStr(form1.N_User), []);
        FParametres := StringReplace(FParametres, '$DB', form1.db, []);
        FParametres := StringReplace(FParametres, '$N', IntToStr(form1.cle), []);
        FParametres := StringReplace(FParametres, '$HANDLE', IntToStr(form1.n_handle), []);
        FParametres := StringReplace(FParametres, '''', '"', [rfReplaceAll]);

        //Recherche d'une action potentiel
        P := pos('[', href);
        PF := pos(']', href);
        if (P > 0) and (PF > 0) then
        begin
            Action := copy(href, P + 1, PF - (P + 1));
            FParametres := copy(FParametres, 1, P - 1);
        end;



        FExe := Trim(FExe);
        FParametres := Trim(FParametres);

        //   Recup_handle := ShellExecute( 0, nil, @nomExe[1], '', '', SW_SHOWNORMAL );
        Recup_handle := ShellExecute(handle, 'open', PChar(FExe), PChar(FParametres), nil, SW_SHOWNORMAL);


    end;

    if pos('OK', uppercase(action)) > 0 then
    begin
        modalresult := Mrok;
    end;
    if pos('CANCEL', uppercase(action)) > 0 then
    begin
        modalresult := Mrcancel;
    end;
    if pos('CLOSE', uppercase(action)) > 0 then
    begin
        SendMessage(HWND(Form1.N_Handle), WM_CLOSE, 0, 0); //où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
    end;

end;

procedure TF_Nav.tv_niveauDblClick(TreeView: TfcCustomTreeView;
    Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
    Y: Integer);
var mode, Action: string;
begin
    if (not (Noeud_niveau_Sel = nil)) then begin

        Action := Recup_Infos_Noeud(Noeud_niveau_Sel.StringData, 2);
        Exec_Action(Action);

    end;
end;

procedure TF_Nav.DvelopperTout1Click(Sender: TObject);
begin
Noeud_niveau_sel.Expand(true);
end;

procedure TF_Nav.RduireTout1Click(Sender: TObject);
begin
Noeud_niveau_sel.collapse(true);
end;

end.

