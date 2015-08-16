unit ActionSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fcButton, fcImgBtn, Db, DBTables, Wwquery, wwdblook, ComCtrls,
  Wwdatsrc, wwstorep, Mask, wwdbedit, wwdbdatetimepicker, ExtCtrls, MagicC, wwDBGrid,
  DBBtn, AdvGlowButton;

type
  TFActionSelect = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BtnOK: TButton;
    BtnCancel: TButton;
    ImageAvancement: TfcImageBtn;
    SP: TwwStoredProc;
    SP_BEFORE: TwwStoredProc;
    wwQuery: TwwQuery;
    wwQueryN_Softini: TIntegerField;
    wwDataSource: TwwDataSource;
    UpdateSQL1: TUpdateSQL;
    Complement1Label: TLabel;
    Complement1: TMagicComplement;
    Complement2Label: TLabel;
    Complement2: TMagicComplement;
    Complement3Label: TLabel;
    Complement4Label: TLabel;
    Complement4: TMagicComplement;
    Complement3: TMagicComplement;
    wwQueryComplement1: TStringField;
    wwQueryComplement2: TStringField;
    wwQueryComplement3: TStringField;
    wwQueryComplement4: TStringField;
    SP_ACTION: TwwStoredProc;
    MagicButton1: TDBButton;
    MagicButton2: TDBButton;
    MagicButton3: TDBButton;
    MagicButton4: TDBButton;
    wwQuerySelect: TStringField;
    SP_AFTER: TwwStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SPAfterOpen(DataSet: TDataSet);
    procedure ValideAction(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure wwQueryCalcFields(DataSet: TDataSet);
  private
    { Déclarations privées }
    Grid : TwwDbGrid;
    PS_Arg_Cle : string;
    InitSelect : string;
  public
    { Déclarations publiques }
    refresh, refreshAll : integer;
    DialogVisible : Boolean;
    WM_Cmd, WM_Arg : integer;
    procedure Init( N_User : integer; nom_procedure, Arg_Cle, Select : string; NbSelect : integer; C : TControl );
  end;

var
  FActionSelect: TFActionSelect;

implementation


{$R *.DFM}

procedure TFActionSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     SP.Close;
     wwQuery.Close;
end;


procedure TFActionSelect.Init( N_User : integer; nom_procedure, Arg_Cle,  Select : string; NbSelect : integer; C : TControl );
Var
       choix : integer;
begin
     refresh := 0;
     DialogVisible := True;

     WM_Cmd := 0;
     WM_Arg := 0;
     
     SP_BEFORE.StoredProcName := nom_procedure+ '_BEFORE';
     SP_BEFORE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
     SP_BEFORE.Params.CreateParam(ftString, '@Select', ptInput);
     SP_BEFORE.ParamByName('@Select').AsAnsiString := Select;
     SP_BEFORE.Params.CreateParam(ftInteger, '@N_User', ptInput);
     SP_BEFORE.ParamByName('@N_User').Asinteger := N_User;
     SP_BEFORE.Params.CreateParam(ftInteger, '@NbSelect', ptInput);
     SP_BEFORE.ParamByName('@NbSelect').Asinteger := NbSelect;

     SP_AFTER.StoredProcName := nom_procedure+ '_AFTER';
     SP_AFTER.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
     SP_AFTER.Params.CreateParam(ftString, '@Select', ptInput);
     SP_AFTER.ParamByName('@Select').AsAnsiString := Select;
     SP_AFTER.Params.CreateParam(ftInteger, '@N_User', ptInput);
     SP_AFTER.ParamByName('@N_User').Asinteger := N_User;
     SP_AFTER.Params.CreateParam(ftInteger, '@NbSelect', ptInput);
     SP_AFTER.ParamByName('@NbSelect').Asinteger := NbSelect;

     if( C is TwwDBGrid ) Then
          Grid := ( C as TwwDBGrid );
     PS_Arg_Cle := Arg_Cle;
     InitSelect := Select;

      Try
         Try
             SP_BEFORE.Open;
         Except
         End;

         if( SP_BEFORE.Active = True ) Then
             begin
                 if( SP_BEFORE.FieldByName( 'Msg' ).asString <> '' ) Then
                     begin
                         choix := Application.Messagebox( PChar( SP_BEFORE.FieldByName( 'Msg' ).asString ), PChar( SP_BEFORE.FieldByName( 'Caption' ).asString ), SP_BEFORE.FieldByName( 'Flags' ).asInteger );
                         if( choix = IDCANCEL )OR( choix = IDNO )OR( choix = IDABORT ) Then
                             begin
                                 SP_BEFORE.Close;
                                 Abort;
                                 Exit;
                             end;
                     end;
                 if( SP_BEFORE.FieldByName( 'Result' ).asInteger <> 1 ) Then
                     begin
                         SP_BEFORE.Close;
                         Abort;
                         Exit;
                     end;
                 SP_BEFORE.Close;
             end;
     Except
         Application.HandleException( Self );
         SP_BEFORE.Close;
         Abort;
         Exit;
     End;

     SP.StoredProcName := nom_procedure + '_DEF';
     SP.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
     SP.Params.CreateParam(ftString, '@select', ptInput);
     SP.ParamByName('@Select').AsAnsiString := Select;
     SP.Params.CreateParam(ftInteger, '@N_User', ptInput);
     SP.ParamByName('@N_User').Asinteger := N_User;
     SP.Params.CreateParam(ftInteger, '@NbSelect', ptInput);
     SP.ParamByName('@NbSelect').Asinteger := NbSelect;

     wwQuery.Open;
     wwQuery.Edit;

     SP.Open;

     SP_ACTION.StoredProcName := nom_procedure;
     SP_ACTION.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
     SP_ACTION.Params.CreateParam(ftString, '@Select', ptInput);
     SP_ACTION.ParamByName('@Select').AsAnsiString := Select;
     SP_ACTION.Params.CreateParam(ftInteger, '@N_User', ptInput);
     SP_ACTION.ParamByName('@N_User').Asinteger := N_User;
     SP_ACTION.Params.CreateParam(ftInteger, '@NbSelect', ptInput);
     SP_ACTION.ParamByName('@NbSelect').Asinteger := NbSelect;
     SP_ACTION.Params.CreateParam(ftString, '@Complement1', ptInput);
     SP_ACTION.Params.CreateParam(ftString, '@Complement2', ptInput);
     SP_ACTION.Params.CreateParam(ftString, '@Complement3', ptInput);
     SP_ACTION.Params.CreateParam(ftString, '@Complement4', ptInput);

     Complement1.FUser := IntToStr( N_User );
     Complement1.FValue := Select;
     Complement1.FHandle := Handle;

     Complement2.FUser := IntToStr( N_User );
     Complement2.FValue := Select;
     Complement2.FHandle := Handle;

     Complement3.FUser := IntToStr( N_User );
     Complement3.FValue := Select;
     Complement3.FHandle := Handle;

     Complement4.FUser := IntToStr( N_User );
     Complement4.FValue := Select;
     Complement4.FHandle := Handle;

     MagicButton1.FUser := IntToStr( N_User );
     MagicButton1.FHandle := Handle;

     MagicButton2.FUser := IntToStr( N_User );
     MagicButton2.FHandle := Handle;

     MagicButton3.FUser := IntToStr( N_User );
     MagicButton3.FHandle := Handle;

     MagicButton4.FUser := IntToStr( N_User );
     MagicButton4.FHandle := Handle;

     MagicButton1.TabStop := True;
     MagicButton2.TabStop := True;
     MagicButton3.TabStop := True;
     MagicButton4.TabStop := True;
end;


procedure TFActionSelect.SPAfterOpen(DataSet: TDataSet);
Var
   i : integer;
   L : TLabel;
   C : TMagicComplement;
   B : TDBButton;
begin
    Caption := SP.FieldByName( 'FormCaption' ).asString;
    Width := SP.FieldByName( 'FormWidth' ).asInteger;
    Height := SP.FieldByName( 'FormHeight' ).asInteger;

    if( SP.FindField( 'Refresh' ) <> nil )AND( SP.FieldByName( 'Refresh' ).asString = '1' ) Then
        refresh := 1;

    if( SP.FindField( 'RefreshAll' ) <> nil )AND( SP.FieldByName( 'RefreshAll' ).asString = '1' ) Then
        refreshAll := 1;

    if( SP.FindField( 'DialogVisible' ) <> nil )AND( SP.FieldByName( 'DialogVisible' ).asString = '0' ) Then
        DialogVisible := False;

    TabSheet1.Caption := SP.FieldByName( 'TabCaption' ).asString;

    For i := 1 To 4 do
        begin
            L := TLabel( FindComponent( 'Complement' + IntToStr( i ) + 'Label' ) );

            if SP.FindField( L.Name ) <> nil Then
               begin
                  L.Caption := SP.FieldByName( L.Name ).asString;
                  L.Visible := Boolean( SP.FieldByName( L.Name + 'Visible' ).asInteger );
                  L.Top := SP.FieldByName( L.Name + 'Top' ).asInteger;
                  L.Left := SP.FieldByName( L.Name + 'Left' ).asInteger;
                  L.Width := SP.FieldByName( L.Name + 'Width' ).asInteger;
                  L.Height := SP.FieldByName( L.Name + 'Height' ).asInteger;
               end;

            C := TMagicComplement( FindComponent( 'Complement' + IntToStr( i ) ) );

            if SP.FindField( C.Name + 'Visible' ) <> nil Then
               begin
                  C.Visible := Boolean( SP.FieldByName( C.Name + 'Visible' ).asInteger );
                  C.Enabled := NOT Boolean( SP.FieldByName( C.Name + 'LectureSeule' ).asInteger );
                  C.Top := SP.FieldByName( C.Name + 'Top' ).asInteger;
                  C.Left := SP.FieldByName( C.Name + 'Left' ).asInteger;
                  C.Width := SP.FieldByName( C.Name + 'Width' ).asInteger;
                  C.Height := SP.FieldByName( C.Name + 'Height' ).asInteger;
                  C.Hint := SP.FieldByName( C.Name + 'InfoBulle' ).asString;
                  if( SP.FieldByName( C.Name + 'CouleurFond' ).asString <> '' ) Then
                      C.Color := SP.FieldByName( C.Name + 'CouleurFond' ).asInteger;
                  C.TypeMagic := SP.FieldByName( C.Name + 'TypeMagic' ).asInteger;

                  if C.TypeMagic = 1 Then
                     begin
                          C.LibelleCaseACocher := SP.FieldByName( C.Name + 'LibelleCaseACocher' ).asString;
                     end;

                  if C.TypeMagic = 3 Then
                     begin
                          C.ListeChaine := SP.FieldByName( C.Name + 'ListeChaine' ).asString;
                          if( TComboBoxStyle( SP.FieldByName( C.Name + 'StyleCombo' ).asInteger ) = stdCtrls.csDropDown ) Then
                              C.StyleCombo := stdCtrls.csDropDown
                          else
                              C.StyleCombo := stdCtrls.csDropDownList;
                     end;

                  if C.TypeMagic = 4 Then
                     begin
                          C.TableLookup := SP.FieldByName( C.Name + 'TableLookup' ).asString;
                          C.ChampVisible := SP.FieldByName( C.Name + 'ChampVisible' ).asString;
                          C.TailleChampVisible := SP.FieldByName( C.Name + 'TailleChampVisible' ).asString;
                          C.ChampVisible2 := SP.FieldByName( C.Name + 'ChampVisible2' ).asString;
                          C.TailleChampVisible2 := SP.FieldByName( C.Name + 'TailleChampVisible2' ).asString;
                          if( TComboBoxStyle( SP.FieldByName( C.Name + 'StyleCombo' ).asInteger ) = stdCtrls.csDropDown ) Then
                              C.StyleCombo := stdCtrls.csDropDown
                          else
                              C.StyleCombo := stdCtrls.csDropDownList;
                          C.OpenTableLookup;
                     end;

                  if C.TypeMagic = 6 Then
                     begin
                          if( TComboBoxStyle( SP.FieldByName( C.Name + 'StyleCombo' ).asInteger ) = stdCtrls.csDropDown ) Then
                              C.StyleCombo := stdCtrls.csDropDown
                          else
                              C.StyleCombo := stdCtrls.csDropDownList;
                          C.PathExe := SP.FieldByName( C.Name + 'Fichier' ).asString;
                          C.Parametre := SP.FieldByName( C.Name + 'Parametre' ).asString;
                     end;

                     if SP.FieldByName( C.Name + 'Valeur' ).asString <> '' Then
                        wwQuery.FieldByName( C.Name ).asString := SP.FieldByName( C.Name + 'Valeur' ).asString;
               end;
                  
            B := TDBButton( FindComponent( 'MagicButton' + IntToStr( i ) ) );

            if SP.FindField( B.Name + 'Visible' ) <> nil Then
               begin
                  B.Visible := Boolean( SP.FieldByName( B.Name + 'Visible' ).asInteger );
                  B.Enabled := NOT Boolean( SP.FieldByName( B.Name + 'LectureSeule' ).asInteger );
                  B.Top := SP.FieldByName( B.Name + 'Top' ).asInteger;
                  B.Left := SP.FieldByName( B.Name + 'Left' ).asInteger;
                  B.Width := SP.FieldByName( B.Name + 'Width' ).asInteger;
                  B.Height := SP.FieldByName( B.Name + 'Height' ).asInteger;
                  B.Hint := SP.FieldByName( B.Name + 'InfoBulle' ).asString;
                  B.PathExe := SP.FieldByName( B.Name + 'Fichier' ).asString;
                  B.Parametre := SP.FieldByName( B.Name + 'Parametre' ).asString;
                  B.Caption := SP.FieldByName( B.Name + 'Texte' ).asString;
                 end;
            //Complement1.DataField.asString := SP.FieldByName( 'Complement1Valeur' ).asString;
        end;
end;

procedure TFActionSelect.wwQueryCalcFields(DataSet: TDataSet);
begin
    DataSet.FieldByName( 'Select' ).AsString := InitSelect;
end;

procedure TFActionSelect.ValideAction(Sender: TObject);
Var
   i : integer;
   ExecUnique : Boolean;
   DS : TDataSet;
   F : TField;
   choix : integer;
   A : TWinControl;
begin
     if( ( ActiveControl <> nil )AND( ActiveControl.Parent is TMagicComplement ) ) Then
         begin //indispensable pour le composant TfcCalcEdit. Si touche Entrée directe, déroulement de la calculatrice qui fait ensuite erreur message de focus
             A := ActiveControl;
             ActiveControl := FindNextControl( ( ActiveControl.Parent as TMagicComplement ), True, True, True );
             ActiveControl := A;
             //si touche Entrée directe, on revalide les champs
             wwQuery.FieldByName( 'Complement1' ).asString := Complement1.Valeur;
             wwQuery.FieldByName( 'Complement2' ).asString := Complement2.Valeur;
             wwQuery.FieldByName( 'Complement3' ).asString := Complement3.Valeur;
             wwQuery.FieldByName( 'Complement4' ).asString := Complement4.Valeur;
         end;

     if( SP.FindField( 'Execution_Action_Unique' ) <> nil )AND( SP.FieldByName( 'Execution_Action_Unique' ).asString = 'Non' ) Then
         begin
              ExecUnique := False;
         end
     else
         begin
              ExecUnique := True;
         end;

     SP_ACTION.ParamByName('@Complement1').AsAnsiString := wwQuery.FieldByName( 'Complement1' ).asString;
     SP_ACTION.ParamByName('@Complement2').AsAnsiString := wwQuery.FieldByName( 'Complement2' ).asString;
     SP_ACTION.ParamByName('@Complement3').AsAnsiString := wwQuery.FieldByName( 'Complement3' ).asString;
     SP_ACTION.ParamByName('@Complement4').AsAnsiString := wwQuery.FieldByName( 'Complement4' ).asString;
     if( not ExecUnique )AND( Grid <> nil )AND( SP.ParamByName('@NbSelect').Asinteger > 0 ) Then
         begin
             Try

                DS := Grid.DataSource.DataSet;

                 if( DS <> nil ) Then
                     begin
                         for i := 0 to Grid.SelectedList.Count - 1 do
                             begin
                                 DS.GoToBookMark( Grid.SelectedList.Items[i] );
                                 if( Grid.SelectedList.IndexOf( Grid.SelectedList.Items[i] ) > -1 ) then
                                     begin
                                         F := DS.FindField( PS_Arg_Cle );
                                         if( F <> nil ) Then
                                             begin
                                                  Try
                                                     SP_ACTION.ParamByName( '@Select' ).AsAnsiString := F.asString;
                                                     SP_ACTION.ExecProc;
                                                  Except
                                                        Application.HandleException( Self );
                                                  End;
                                             end;
                                     end;
                             end;
                     end;

(*

                  For i := 0 To SP.ParamByName('@NbSelect').Asinteger - 1 do
                      begin
                           Try
    //                          SP_ACTION.ParamByName('@Select').AsString := wwQuery.FieldByName( 'Complement1' ).asString;
                              SP_ACTION.ExecProc;
                           Except
                               Application.HandleException( Self );
                           End;
                      end;
*)
              Finally
              End;

         end
     else
         begin
             Try
                SP_ACTION.ExecProc;
             Except
                 Application.HandleException( Self );
             End;
         end;


      Try
         Try
             SP_AFTER.Open;
         Except
         End;

         if( SP_AFTER.Active = True ) Then
             begin
                 if( SP_AFTER.FindField( 'WM_Cmd' ) <> nil ) Then
                    WM_Cmd := SP_AFTER.FieldByName( 'WM_Cmd' ).AsInteger;
                 if( SP_AFTER.FindField( 'WM_Arg' ) <> nil ) Then
                    WM_Arg := SP_AFTER.FieldByName( 'WM_Arg' ).AsInteger;
                 if( SP_AFTER.FieldByName( 'Msg' ).asString <> '' ) Then
                     begin
                         choix := Application.Messagebox( PChar( SP_AFTER.FieldByName( 'Msg' ).asString ), PChar( SP_AFTER.FieldByName( 'Caption' ).asString ), SP_AFTER.FieldByName( 'Flags' ).asInteger );
                         if( choix = IDCANCEL )OR( choix = IDNO )OR( choix = IDABORT ) Then
                             begin
                                 SP_AFTER.Close;
                                 Abort;
                                 Exit;
                             end;
                     end;
                 if( SP_AFTER.FieldByName( 'Result' ).asInteger <> 1 ) Then
                     begin
                         SP_AFTER.Close;
                         Abort;
                         Exit;
                     end;
                 SP_AFTER.Close;
             end;
     Except
         Application.HandleException( Self );
         SP_AFTER.Close;
         Abort;
         Exit;
     End;
End;


procedure TFActionSelect.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if( ModalResult = mrOK ) Then
        ValideAction( nil )
     else
          begin
              refresh := 0;
              refreshAll := 0;
          end;
end;

end.
