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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  F_Wait: TF_Wait;

implementation

{$R *.dfm}

end.
