unit ThreadImportProduitSpecifique;

interface

uses
  Classes, stdctrls, comctrls, wwstorep, SysUtils;

type
  TThreadImportProduitSpecifique = class(TThread)
  private
    { Déclarations privées }
     LabelEtapeCaption : string;
     LabelCommentaireCaption : string;

     EFichier : TEdit;
     LabelEtape, LabelCommentaire : TLabel;
     E_ETape: Tedit;

     IMPORT0, IMPORT1, IMPORT2, IMPORT3, IMPORT4 : TwwStoredProc;
     Animate : TAnimate;
     NumDossier : integer;
     NumFournisseur : integer;
     NumUser : integer;
     procedure rafraichitLabels;
  protected
    procedure Execute; override;
  public
    Stopped : Boolean;
    constructor Create( E,ET : TEdit; L1, L2 : TLabel; A: TAnimate; I0, I1, I2, I3, I4 : TwwStoredProc; Check : Boolean; ndossier, nfournisseur, nuser : integer );
  end;

implementation

{ Important : Les méthodes et propriétés des objets des VCL ne peuvent être
  utilisées que dans des méthodes appelées avec Synchronize; par exemple :

      Synchronize(UpdateCaption);

  et UpdateCaption pourrait être :

    procedure TThreadImportProduitSpecifique.UpdateCaption;
    begin
      Form1.Caption := 'Mise à jour dans un thread';
    end; }

{ TThreadImportProduitSpecifique }

uses
   forms;

  constructor TThreadImportProduitSpecifique.Create( E,ET : TEdit; L1, L2 : TLabel; A: TAnimate; I0, I1, I2, I3, I4 : TwwStoredProc; Check : Boolean; ndossier, nfournisseur, nuser : integer );
begin
  Stopped := False;
  EFichier := E;
  E_ETape:=ET;
  LabelEtape := L1;
  LabelCommentaire := L2;
  Animate := A;
  IMPORT0 := I0;
  IMPORT1 := I1;
  IMPORT2 := I2;
  IMPORT3 := I3;
  IMPORT4 := I4;
  NumDossier := ndossier;
  NumFournisseur := nfournisseur;
  NumUser := nuser;
  FreeOnTerminate := True;
  inherited Create(False);
end;


procedure TThreadImportProduitSpecifique.RafraichitLabels;
begin
    LabelEtape.Caption := LabelEtapeCaption;
    LabelCommentaire.Caption := LabelCommentaireCaption;
    E_Etape.Text:=LabelEtapeCaption;
(*
    LabelCount.Repaint;
*)
    Animate.Visible := True;
    Animate.Active  := True;
(*
    Animate.Repaint;
*)
end;



procedure TThreadImportProduitSpecifique.Execute;
Var dir : string;
   erreur : Boolean;
   StringList: TStringList;
   Temp_String: string ;
begin
  { Placez le code du thread ici }
   Try
       erreur := False;
       LabelEtapeCaption := 'Lancement de la';
       LabelCommentaireCaption := 'procédure d''importation';
       Synchronize( RafraichitLabels );

       if( not Terminated AND not Stopped ) Then
           begin
               Dir := ExtractFilePath( EFichier.Text );
               if( Dir[Length(Dir)] = '\' ) Then Delete( Dir, Length( Dir ), 1 );
               LabelEtapeCaption := 'Etape 1/5 en cours...';
               LabelCommentaireCaption := 'construction du fichier Texte en cours...';
               Synchronize( RafraichitLabels );
               IMPORT0.ParamByName( '@Directory' ).asString := Dir;
               IMPORT0.ExecProc;

               //Correction du fichier texte
               StringList:= TStringList.Create;
               StringList.LoadFromFile(Dir + '\Tout.res');
               Temp_String:=StringList.Strings[StringList.count-1];
               if Temp_String=#$1A Then
                  Begin
                       StringList.delete(StringList.count-1);
                       StringList.SaveToFile(Dir + '\Tout.res')
                  end;
               StringList.Destroy;
           end;

       if( not Terminated AND not Stopped ) Then
           begin
               LabelEtapeCaption := 'Etape 2/5 en cours...';
               LabelCommentaireCaption := 'importation en bloc des données...';
               Synchronize( RafraichitLabels );
               IMPORT1.ParamByName( '@Directory' ).asString := Dir;
               IMPORT1.ExecProc;
           end;

       if( not Terminated AND not Stopped ) Then
           begin
               LabelEtapeCaption := 'Etape 3/5 en cours...';
               LabelCommentaireCaption := 'vérification et différention nouveautés/mises à jour...';
               Synchronize( RafraichitLabels );
               IMPORT2.ExecProc;
           end;

       if( not Terminated AND not Stopped ) Then
           begin
               LabelEtapeCaption := 'Etape 4/5 en cours...';
               LabelCommentaireCaption := 'Traitement des nouveautés...';
               Synchronize( RafraichitLabels );
               IMPORT3.ParamByName( '@Parent' ).asInteger := NumDossier;
               IMPORT3.ParamByName( '@N_Fourniss' ).asInteger := NumFournisseur;
               IMPORT3.ParamByName( '@N_User' ).asInteger := NumUser;
               IMPORT3.ExecProc;
               
           end;

       if( not Terminated AND not Stopped ) Then
           begin
               LabelEtapeCaption := 'Etape 5/5 en cours...';
               LabelCommentaireCaption := 'Traitement des mises à jour...';
               Synchronize( RafraichitLabels );
               IMPORT4.ParamByName( '@N_Fourniss' ).asInteger := NumFournisseur;
               IMPORT4.ParamByName( '@N_User' ).asInteger := NumUser;
               IMPORT4.ParamByName( '@Parent' ).asInteger := NumDossier;
               IMPORT4.ExecProc;
               
           end;
   except                         
       erreur := True;
       Animate.Active := False;
       Animate.Visible := False;
       Application.HandleException( Self );
   End;

   if( erreur = True ) Then
       begin
           LabelEtapeCaption := 'Importation interrompue...  ';
           LabelCommentaireCaption := 'Erreur...';
       end
   else
       if( Stopped = True ) Then
           begin
               LabelEtapeCaption := 'Importation interrompue...  ';
               LabelCommentaireCaption := 'par l''utilisateur...';
           end
       else
           begin
               LabelEtapeCaption := 'Importation terminée...  ';
               LabelCommentaireCaption := '';
           end;
   Synchronize( RafraichitLabels );
   Animate.Active := False;
   Animate.Visible := False;
end;

end.
