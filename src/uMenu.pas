unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, XPMan, Menus, ImgList, jpeg, StdCtrls, DBXpress, DB, SqlExpr;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    btnClientes: TSpeedButton;
    btnOrdemDeServico: TSpeedButton;
    XPManifest1: TXPManifest;
    btnRelatorios: TSpeedButton;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    R1: TMenuItem;
    C2: TMenuItem;
    S1: TMenuItem;
    ImageListIcones: TImageList;
    C3: TMenuItem;
    R2: TMenuItem;
    R3: TMenuItem;
    S2: TMenuItem;
    A1: TMenuItem;
    imgPlanoFundo: TImage;
    Panel3: TPanel;
    lblDataHorario: TLabel;
    TimerRelogio: TTimer;
    dlgOpen1: TOpenDialog;
    O1: TMenuItem;
    O2: TMenuItem;
    procedure btnSairClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerRelogioTimer(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure O2Click(Sender: TObject);
    procedure btnOrdemDeServicoClick(Sender: TObject);
  private
    { Private declarations }
    procedure LerImagemFundo();
    procedure IniciarRelogio();
    procedure CarregarDataModule();
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
  FLocalAplicacao: String;
  FConexao: String;

implementation

uses uSobre, Math, uDM, uClientes, uUtilidades, uOrdemServico,
  uEscolhaConexao;

{$R *.dfm}

procedure TfrmMenu.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenu.S1Click(Sender: TObject);
begin
  if btnSair.Enabled then
    btnSair.Click;
end;

procedure TfrmMenu.S2Click(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;
end;

procedure TfrmMenu.A1Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  ArquivoPlanoFundo: TStringList;
begin
  OpenDialog := TOpenDialog.Create(Self);
  ArquivoPlanoFundo := TStringList.Create;
  try
    OpenDialog.DefaultExt := '';
    OpenDialog.Filter := '*.jpg|*.jpg';
    OpenDialog.FilterIndex := 1;
    OpenDialog.Execute;
    if(FileExists(openDialog.FileName))then
    begin
      imgPlanoFundo.Picture.LoadFromFile(openDialog.FileName);
      ArquivoPlanoFundo.Add(OpenDialog.FileName);

      if(Application.MessageBox('Você deseja esticar a imagem para preencher a tela?','Atenção',MB_ICONQUESTION + MB_YESNO)=mrYes)then
      begin
        ArquivoPlanoFundo.Add('S');
        imgPlanoFundo.Stretch := true;
      end else
      begin
        ArquivoPlanoFundo.Add('N');
        imgPlanoFundo.Stretch := false;
      end;

      ArquivoPlanoFundo.SaveToFile(FLocalAplicacao+'planodefundo.ini');
    end;
  finally
    OpenDialog.Free;
    ArquivoPlanoFundo.Free;
  end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  FLocalAplicacao := ExtractFilePath(Application.ExeName);
  frmEscolhaConexao := TfrmEscolhaConexao.Create(Self);
  frmEscolhaConexao.ShowModal;
  CarregarDataModule();
  LerImagemFundo();
  IniciarRelogio();
end;

procedure TfrmMenu.LerImagemFundo();
var
  ArquivoPlanoFundo: TStringList;
begin
  ArquivoPlanoFundo := TStringList.Create;
  try
    if(FileExists(FLocalAplicacao+'planodefundo.ini'))then
    begin
      ArquivoPlanoFundo.LoadFromFile(FLocalAplicacao+'planodefundo.ini');
      if(ArquivoPlanoFundo.Count > 0)and(ArquivoPlanoFundo[0] <> '')then
      begin
        if(ArquivoPlanoFundo.Count > 0)and(FileExists(ArquivoPlanoFundo[0]))then
        begin
          imgPlanoFundo.Picture.LoadFromFile(ArquivoPlanoFundo[0]);
          if(ArquivoPlanoFundo.Count > 1)and(ArquivoPlanoFundo[1] = 'S')then
            imgPlanoFundo.Stretch := true;
        end;
      end;
    end;
  finally
    ArquivoPlanoFundo.Free;
  end;
end;

procedure TfrmMenu.IniciarRelogio();
begin
  TimerRelogio.Enabled := true;
end;

procedure TfrmMenu.TimerRelogioTimer(Sender: TObject);
begin
  lblDataHorario.Caption := FormatDateTime('DD/MM/YYYY',Date)+' '+FormatDateTime('hh:m:ss',Time)+'   ';
end;

procedure TfrmMenu.CarregarDataModule();
begin
  if not(FileExists(FLocalAplicacao+'BASEDADOS.FDB'))then
  begin
    ShowMessage('Arquivo do banco de dados BASEDADOS.FDB não encontrado!');
    Abort;
  end;
  DM := TDM.Create(Self);
  TUtilidades.VerificarTabelas;
  if(FConexao = 'Zeos')then
  begin
    DM.TCliente.Open;
    DM.TOrdemServico.Open;
    DM.TItemOrdem.Open;
  end else
  begin
    DM.TBCliente.Open;
    DM.TBOrdemServico.Open;
    DM.TBItemOrdem.Open;
  end;
end;

procedure TfrmMenu.btnClientesClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(Self);
  frmClientes.ShowModal;
end;

procedure TfrmMenu.C3Click(Sender: TObject);
begin
  if(btnClientes.Enabled)then
    btnClientes.Click;
end;

procedure TfrmMenu.O2Click(Sender: TObject);
begin
  if(btnOrdemDeServico.Enabled)then
    btnOrdemDeServico.Click;
end;

procedure TfrmMenu.btnOrdemDeServicoClick(Sender: TObject);
begin
  frmOrdemServico := TfrmOrdemServico.Create(Self);
  frmOrdemServico.ShowModal;
end;

end.
