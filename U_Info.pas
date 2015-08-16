unit U_Info;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TF_Info = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbl_hauteur: TLabel;
    lbl_largeur: TLabel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  F_Info: TF_Info;

implementation

{$R *.DFM}

end.
