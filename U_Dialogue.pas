unit U_Dialogue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, paramlabel, ExtCtrls, ParamListbox, Db, DBTables, wwstorep;

type
  TF_Filtres = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    wsp_Filtres: TwwStoredProc;
    AdvPanelFiltres: TParamListBox;
    Button2: TButton;
    procedure wsp_FiltresAfterClose(DataSet: TDataSet);
    procedure Init;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    Tab_Filtre : array [0..9] of string ;
    Tab_Mem_Filtre : array [0..9] of string ;

    Filtre_Plus : string;
    Mem_Filtre_Plus : string;
    Code_Session : String;
  end;

var
  F_Filtres: TF_Filtres;

implementation

{$R *.DFM}

procedure TF_Filtres.Init;
begin
//Init
AdvPanelFiltres.Items.Clear;
AdvPanelFiltres.ItemHeight := wsp_Filtres.FieldByName( 'Hauteur_Ligne' ).asinteger;
HEight := wsp_Filtres.FieldByName( 'Height' ).asinteger;
Width := wsp_Filtres.FieldByName( 'Width' ).asinteger;
Caption := wsp_Filtres.FieldByName( 'Caption' ).asstring;
While Not wsp_Filtres.Eof Do
Begin
     AdvPanelFiltres.Items.Add( wsp_Filtres.FieldByName( 'msg' ).asString);
     wsp_Filtres.Next;
End;
end;

procedure TF_Filtres.wsp_FiltresAfterClose(DataSet: TDataSet);
begin
AdvPanelFiltres.Items.Clear;
end;


procedure TF_Filtres.Button1Click(Sender: TObject);
Var i : integer;
begin
  for i := 0 to AdvPanelFiltres.ParamRefCount-1 do
  begin
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE('@Filtre0') Then
           Tab_Mem_Filtre[0] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre1') Then
           Tab_Mem_Filtre[1] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre2') Then
           Tab_Mem_Filtre[2] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre3') Then
           Tab_Mem_Filtre[3] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre4') Then
           Tab_Mem_Filtre[4] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre5') Then
           Tab_Mem_Filtre[5] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre6') Then
           Tab_Mem_Filtre[6] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre7') Then
           Tab_Mem_Filtre[7] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
       if  UPPERCASE(AdvPanelFiltres.ParamRefs[i]) =  UPPERCASE ('@Filtre8') Then
           Tab_Mem_Filtre[8] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
  end;

end;

procedure TF_Filtres.Button3Click(Sender: TObject);
Var i : integer;
begin
  for i := 0 to AdvPanelFiltres.ParamRefCount-1 do
  begin
        AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]] := '?' ;
  end;


end;

procedure TF_Filtres.FormClose(Sender: TObject; var Action: TCloseAction);
Var i : integer;
begin
     AdvPanelFiltres.Items.Clear;
     AdvPanelFiltres.Free;
end;

end.
