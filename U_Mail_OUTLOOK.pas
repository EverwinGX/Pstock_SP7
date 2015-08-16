unit U_Mail_OUTLOOK;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, OleServer, Mapi, ComObj, Outlook_TLB, ADODB, OutlookXP, uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet, uADCompClient;

type
  TF_Mail_OUTLOOK = class(TForm)
    wq_Outlook2: TADOQuery;
    wq_Outlook_dest2: TADOQuery;
    wq_Outlook_Fic2: TADOQuery;
    OutlookApplication1: TOutlookApplication;
    wq_Outlook: TADQuery;
    wq_Outlook_dest: TADQuery;
    wq_Outlook_Fic: TADQuery;
    procedure Send_Mail(Param_N_user: integer);
  private
    { Déclarations privées }
  public

  end;

const
  olMailItem = 0;

var
  Outlook, NmSpace, Folder, AM, I: OleVariant;
  miMail, objRecipient: Variant;
  F_Mail_OUTLOOK: TF_Mail_OUTLOOK;

implementation

{$R *.DFM}
 uses
 MAIN;

procedure TF_Mail_OUTLOOK.Send_Mail(Param_N_user: integer);
begin
  wq_Outlook.close;
  wq_Outlook.Params.ParamByName('N_user').asinteger := Param_N_user;
  wq_Outlook.Open;
  wq_Outlook.Last;
  wq_Outlook.First;
  Outlook := CreateOleObject('Outlook.Application');
  try
    while not(wq_Outlook.Eof) do
    begin

      miMail := Outlook.CreateItem(olMailItem);

      miMail.Subject := wq_Outlook.FieldByName('Objet').asstring;
      if wq_Outlook.FieldByName('CorpsHtml').asstring <> '' then
      begin
        miMail.HTMLBody := wq_Outlook.FieldByName('CorpsHtml').asstring;
      end;

      // définition de la priorité
      case wq_Outlook.FieldByName('Priorite').asinteger of
        0:
          miMail.Importance := olImportanceLow; // ,Normal=olImportanceNormal,Haut=olImportanceHigh);
        1:
          miMail.Importance := olImportanceNormal; // ,Normal=olImportanceNormal,Haut=olImportanceHigh);
        2:
          miMail.Importance := olImportanceHigh; // ,Normal=olImportanceNormal,Haut=olImportanceHigh);
      end;

      wq_Outlook_dest.close;
      wq_Outlook_dest.Params.ParamByName('N_Mail').asinteger := wq_Outlook.FieldByName
        ('N_Mail').asinteger;
      wq_Outlook_dest.Open;
      wq_Outlook_dest.Last;
      wq_Outlook_dest.First;
      while not(wq_Outlook_dest.Eof) do
      begin
        if UPPERCASE(wq_Outlook_dest.FieldByName('Type_A').asstring)
          = 'OUI' then
        begin
          objRecipient := miMail.Recipients.Add
            (wq_Outlook_dest.FieldByName('Destinataire').asstring);
          objRecipient. Type := olTo; // 'olBCC, olCC, olOriginator ou olTo.
          objRecipient.Resolve;
        end;
        if UPPERCASE(wq_Outlook_dest.FieldByName('Type_CC').asstring)
          = 'OUI' then
        begin
          objRecipient := miMail.Recipients.Add
            (wq_Outlook_dest.FieldByName('Destinataire').asstring);
          objRecipient. Type := olCC; // 'olBCC, olCC, olOriginator ou olTo.
          objRecipient.Resolve;
        end;
        if UPPERCASE(wq_Outlook_dest.FieldByName('Type_CCI').asstring)
          = 'OUI' then
        begin
          objRecipient := miMail.Recipients.Add
            (wq_Outlook_dest.FieldByName('Destinataire').asstring);
          objRecipient. Type := olBCC; // 'olBCC, olCC, olOriginator ou olTo.
          objRecipient.Resolve;
        end;
        // miMail.Recipients.Add(wq_Outlook.FieldByName('Destinataire').asstring);
        wq_Outlook_dest.Next;
      end;

      wq_Outlook_Fic.close;
      wq_Outlook_Fic.Params.ParamByName('N_Mail').asinteger := wq_Outlook.FieldByName
        ('N_Mail').asinteger;
      wq_Outlook_Fic.Open;
      wq_Outlook_Fic.Last;
      wq_Outlook_Fic.First;
      while not(wq_Outlook_Fic.Eof) do
      begin
        miMail.Attachments.Add(wq_Outlook_Fic.FieldByName('NomComplet')
            .asstring);
        wq_Outlook_Fic.Next;
      end;

      if (UPPERCASE(wq_Outlook.FieldByName('Envoi').asstring) = 'OUI') then
      begin
       miMail.display;
        miMail.send;
      end
      else
      begin
        if wq_Outlook.FindField('Ouvrir') <> nil then
        begin
          if wq_Outlook.FieldByName('Ouvrir').asstring = 'Oui' then
          begin
            try
              miMail.display;
            except
            end;
          end
          else
          begin

            miMail.close(0);
          end;
        end
        else
        begin
        try
          miMail.display;
        except
        end;
      end;

      end;

      wq_Outlook.Edit;
      wq_Outlook.FieldByName('Envoye').asstring := 'Oui';
      wq_Outlook.FieldByName('Signature_Envoi').asstring :=
        'Envoyé par PS le : ' + datetimetostr(now);
      wq_Outlook.post;


      VarClear(miMail);
      wq_Outlook.Next;
    end;
  finally
    VarClear(Outlook);
    VarClear(miMail);

  end;

end;

end.
