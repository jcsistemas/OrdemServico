unit uRelatorioOrdemServicoQuick;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, FMTBcd, DB, SqlExpr, DBClient,
  Provider;

type
  TfrmRelatorioOrdemServicoQuick = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    txtFiltro: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape3: TQRShape;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    txtSomaTotal: TQRLabel;
    QRLabel9: TQRLabel;
    txtQuantidadeListada: TQRLabel;
    QRelatorio: TSQLQuery;
    DSPRelatorio: TDataSetProvider;
    TBRelatorio: TClientDataSet;
    DSRelatorio: TDataSource;
    TBRelatorioID: TIntegerField;
    TBRelatorioDATA_ABERTURA: TDateField;
    TBRelatorioDATA_PREVISTA: TDateField;
    TBRelatorioDATA_FECHAMENTO: TDateField;
    TBRelatorioSTATUS: TStringField;
    TBRelatorioVALOR_TOTAL: TFMTBCDField;
    TBRelatorioNOME: TStringField;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioOrdemServicoQuick: TfrmRelatorioOrdemServicoQuick;
  FSomaTotal: Double;
  FQuantidade: Integer;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmRelatorioOrdemServicoQuick.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  i: Integer;
begin
  for i := 0 to Screen.FormCount - 1 do
  if Screen.Forms[i].ClassName = 'TQRStandardPreview' then
  begin
     Screen.Forms[i].BorderIcons:= Screen.Forms[i].BorderIcons-[biMinimize];
     Screen.Forms[i].BorderIcons:= Screen.Forms[i].BorderIcons-[biMaximize];
  end;
  FSomaTotal := 0;
  FQuantidade := 0;
end;

procedure TfrmRelatorioOrdemServicoQuick.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FSomaTotal := FSomaTotal + TBRelatorioVALOR_TOTAL.AsFloat;
  FQuantidade := FQuantidade + 1;
end;

procedure TfrmRelatorioOrdemServicoQuick.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  txtSomaTotal.Caption := FormatFloat('R$###,###,##0.00',FSomaTotal);
  txtQuantidadeListada.Caption := IntToStr(FQuantidade);
end;

end.
