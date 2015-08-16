unit Attendre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    procedure FormActivate(Sender: TObject);
    procedure Refresh;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}


procedure TForm2.FormActivate(Sender: TObject);
begin
Application.ProcessMessages;
end;

procedure TForm2.Refresh;
begin
Application.ProcessMessages;
end;

end.
