unit U_Wait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvCircularProgress, fcLabel;

type
  TF_Wait = class(TForm)
    fcLabel1: TfcLabel;
    AdvCircularProgress1: TAdvCircularProgress;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  F_Wait: TF_Wait;

implementation

{$R *.dfm}

end.
