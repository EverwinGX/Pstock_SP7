unit ThreadGenesysSPINFO;

interface

uses
    Classes, stdctrls, comctrls, wwstorep, SysUtils, AdvEdit,Wwquery;

type
    TThreadGenesysSPINFO = class(TThread)
    private
        { D�clarations priv�es }
        LabelCaption: string;

        LabelEdit: TadvEdit;

        SPinfo: TwwStoredProc;
        wq_msg: Twwquery;

        procedure rafraichitLabels;
    protected
        procedure Execute; override;
    public
        Stopped: Boolean;
        constructor Create(L1: TadvEdit; I0: TwwStoredProc;w0 :Twwquery );
    end;

implementation

uses
    forms;

{ Important : les m�thodes et les propri�t�s des objets dans la VCL ne peuvent
  �tre utilis�es que dans une m�thode appel�e en utilisant Synchronize, par exemple :

      Synchronize(UpdateCaption);

  o� UpdateCaption pourrait �tre du type :

    procedure TThreadGenesysSPINFO.UpdateCaption;
    begin
      Form1.Caption := 'Mis � jour dans un thread';
    end; }

{ TThreadGenesysSPINFO }

constructor TThreadGenesysSPINFO.Create(L1: TadvEdit; I0: TwwStoredProc;w0 :Twwquery);
begin
    LabelEdit := L1;
    SPinfo := I0;
     wq_msg:=w0;
    FreeOnTerminate := True;
    inherited Create(False);
end;

procedure TThreadGenesysSPINFO.RafraichitLabels;
begin
    LabelEdit.text := LabelCaption;
end;

procedure TThreadGenesysSPINFO.Execute;
begin
    if (not Terminated and not Stopped) then
    begin
        //SPinfo.ExecProc;
        wq_msg.close;
        wq_msg.open;

        LabelCaption := wq_msg.fieldbyname('Msg').asstring;

        Synchronize(RafraichitLabels);
    end;

end;

end.

