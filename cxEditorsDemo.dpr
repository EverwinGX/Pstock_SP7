program cxEditorsDemo;

uses
  Forms,
  DemoDM in '..\common\DemoDM.pas' {dmDemo: TDataModule},
  BasicDemoMain in '..\common\BasicDemoMain.pas' {frmBasicDemoMain},
  AboutDemoForm in '..\common\AboutDemoForm.pas' {frmAboutDemoForm},
  cxEditorsDemoMain in 'cxEditorsDemoMain.pas' {frmEditorsDemoMain};

  {$R *.res}
{$IF defined(VER220) or defined(VER210) or defined(VER185) or defined(VER150)}
  {$R WindowsXP.res}
{$IFEND}

begin
  Application.Initialize;
  Application.CreateForm(TdmDemo, dmDemo);
  Application.CreateForm(TfrmEditorsDemoMain, frmEditorsDemoMain);
  Application.Run;
end.
