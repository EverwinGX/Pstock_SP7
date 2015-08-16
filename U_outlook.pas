unit U_outlook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Outlook8, OleServer,Mapi,ComObj, HTMLDialog, AdvMemo, AdvmWS,
  Db, DBTables, wwstorep;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    HTML_Entete: TAdvMemo;
    HTML_Corps: TAdvMemo;
    HTML_PIED: TAdvMemo;
    HTML_FINAL: TAdvMemo;
    Database: TDatabase;
    sp_HTML: TwwStoredProc;
    procedure Button1Click(Sender: TObject);

    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

const
  olMailItem = 0;

var
  Outlook, NmSpace, Folder,AM,I: OleVariant;
  miMail: Variant;
  Form1: TForm1;


implementation

{$R *.DFM}



procedure TForm1.Button1Click(Sender: TObject);
Var   HTML: string;
begin
  Database.Open;
  Outlook := CreateOleObject('Outlook.Application');

  sp_HTML.close;
  sp_HTML.ParamByName('@N_affaire').asinteger := 1503;
  sp_HTML.open;
  HTML:= sp_HTML.fieldbyname('HTML').asstring;
   sp_HTML.close;
  miMail := Outlook.CreateItem(olMailItem);

  miMail.Recipients.Add('billy@boy.com');
  miMail.Subject := 'Hello Bill';

  // use this to send a plain text email (all versions of Outlook)
  //miMail.Body := 'Attached is the list of email addresses.';

  // alternatively send an HTML email (not in Outlook 97)
  try
  miMail.display;
  except
  end;
   miMail.HTMLBody := HTML ;
 // miMail.Attachments.Add('C:\temp\list.txt', EmptyParam, EmptyParam, EmptyParam);
  miMail:= Unassigned;
  Outlook := Unassigned;
 Database.close;
  //...
end;

end.
