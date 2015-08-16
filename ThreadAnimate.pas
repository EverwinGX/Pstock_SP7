unit ThreadAnimate;
interface
uses
  Classes,
  stdctrls,
  comctrls,
  extctrls,
  SysUtils,
  uADCompClient,
  uADStanError,
  windows,
  AdvCircularProgress,
  wwstorep,
  Forms,
  Messages,
  AdvEdit;
type
  TThreadAnimate = class(TThread)

  private
    { Déclarations privées }
    LabelCommentaireCaption: string;
    LabelCommentaire: Tedit;
    ProgressAnim: TadvcircularProgress;
    Timer1: TTimer;


    procedure rafraichit;
  protected
    procedure Execute; override;
  public
    Stopped: Boolean;
    constructor Create(Form : TForm;L1: Tedit; Progress: TadvcircularProgress);
  end;
implementation
{ Important : Les méthodes et propriétés des objets des VCL ne peuvent être
  utilisées que dans des méthodes appelées avec Synchronize; par exemple :

  Synchronize(UpdateCaption);

  et UpdateCaption pourrait être :

  procedure TThreadAnimate.UpdateCaption;
  begin
  Form1.Caption := 'Mise à jour dans un thread';
  end; }
{ TThreadAnimate }
uses U_Wait;

constructor TThreadAnimate.Create(Form : Tform;L1: Tedit; Progress: TadvcircularProgress);

begin
    LabelCommentaire := L1;
  ProgressAnim := Progress;
  FreeOnTerminate := True;

  inherited Create(False);
end;

procedure TThreadAnimate.rafraichit;
begin
  ProgressAnim.Position := ProgressAnim.Position + 1;
  if ProgressAnim.Position >= ProgressAnim.Max then
    begin
      ProgressAnim.Position := 1;
  end;
  ProgressAnim.Update;


end;
procedure TThreadAnimate.Execute;
var
    i: integer;
begin
  { Placez le code du thread ici }
  try
    if (not Terminated and not Stopped) then
      begin

      for i := 0 to 40000
        do
        begin
        Synchronize(rafraichit);
        sleep(500);
      end;
      // Concatene_Memos;
    end;
  except
    // Application.HandleException(Self);
  end;
end;
end.
