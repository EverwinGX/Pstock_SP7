program Saisie_Grille;

uses
  Forms,
  MAIN in '..\MFP_SOFT\Saisie_Multiple\MAIN.pas' {Form1},
  Attendre in '..\MFP_SOFT\Saisie_Multiple\Attendre.pas' {Form2},
  WM_GENESYS in '..\MFP_SOFT\Saisie_Multiple\WM_GENESYS.pas',
  U_SQL in '..\MFP_SOFT\Saisie_Multiple\U_SQL.pas' {F_SQL};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
