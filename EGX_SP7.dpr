program EGX_SP7;



uses
  Forms,
  MAIN in 'MAIN.pas' {Form1},
  WM_GENESYS in 'WM_GENESYS.pas',
  ThreadGenesysSP in 'ThreadGenesysSP.pas',
  U_Params in 'U_Params.pas' {F_Params},
  ThreadGenesysSPINFO in 'ThreadGenesysSPINFO.pas',
  U_Mail_OUTLOOK in 'U_Mail_OUTLOOK.pas' {F_Mail_OUTLOOK},
  U_Info in 'U_Info.pas' {F_Info},
  U_Navigation in 'U_Navigation.pas' {F_Nav},
  U_Params2 in 'U_Params2.pas' {F_Params2},
  ThreadAnimate in 'ThreadAnimate.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TF_Params2, F_Params2);
  Application.Run;
end.
