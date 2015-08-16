unit DemoDM;

interface

uses
  SysUtils, Classes, DB, dxLayoutLookAndFeels, cxLookAndFeels, dxmdaset;

type
  TdmDemo = class(TDataModule)
    dsOrders: TDataSource;
    llcfMain: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxLayoutOfficeLookAndFeel1: TdxLayoutOfficeLookAndFeel;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    mdOrders: TdxMemData;
    mdOrdersPurchaseDate: TDateTimeField;
    mdOrdersOrders_Time: TDateTimeField;
    mdOrdersPaymentType: TStringField;
    mdOrdersPaymentAmount: TFloatField;
    mdOrdersQuantity: TIntegerField;
    mdOrdersFirstName: TStringField;
    mdOrdersLastName: TStringField;
    mdOrdersCompany: TStringField;
    mdOrdersPrefix: TStringField;
    mdOrdersTitle: TStringField;
    mdOrdersAddress: TStringField;
    mdOrdersCity: TStringField;
    mdOrdersState: TStringField;
    mdOrdersZipCode: TStringField;
    mdOrdersSource: TStringField;
    mdOrdersCustomer: TStringField;
    mdOrdersHomePhone: TStringField;
    mdOrdersFaxPhone: TStringField;
    mdOrdersSpouse: TStringField;
    mdOrdersOccupation: TStringField;
    mdOrdersEmail: TStringField;
    mdOrdersTrademark: TStringField;
    mdOrdersModel: TStringField;
    mdOrdersHP: TSmallintField;
    mdOrdersLiter: TFloatField;
    mdOrdersCyl: TSmallintField;
    mdOrdersTransmissSpeedCount: TSmallintField;
    mdOrdersTransmissAutomatic: TStringField;
    mdOrdersMPG_City: TSmallintField;
    mdOrdersMPG_Highway: TSmallintField;
    mdOrdersCategory: TStringField;
    mdOrdersCars_Description: TMemoField;
    mdOrdersHyperlink: TStringField;
    mdOrdersPicture: TBlobField;
    mdOrdersPrice: TFloatField;
    mdOrdersCustomers_ID: TIntegerField;
    mdOrdersOrders_ID: TIntegerField;
    mdOrdersCars_ID: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDemo: TdmDemo;

implementation

{$R *.dfm}

end.
