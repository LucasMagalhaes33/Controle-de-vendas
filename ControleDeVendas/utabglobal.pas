unit uTABGLOBAL;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, SQLDB, DB, Forms, Controls, Graphics,
  Dialogs;

type

  { TTabGlobal }

  TTabGlobal = class(TForm)
    Conexao: TIBConnection;
    DsVendasPgto: TDataSource;
    DsVendaItem: TDataSource;
    DsVendas: TDataSource;
    DsEstoqueItem: TDataSource;
    DsEstoque: TDataSource;
    DsFormaPgto: TDataSource;
    DsProdutos: TDataSource;
    DsGrupos: TDataSource;
    DsFornecedores: TDataSource;
    DsClientes: TDataSource;
    DClientes: TSQLQuery;
    DClientesBAIRRO: TStringField;
    DClientesCEP: TStringField;
    DClientesCIDADE: TStringField;
    DClientesCODIGO: TLongintField;
    DClientesENDERECO: TStringField;
    DClientesNOME: TStringField;
    DClientesTELEFONE: TStringField;
    DClientesUF: TStringField;
    DEstoqueCODFOR: TLongintField;
    DEstoqueDOCTO: TStringField;
    DEstoqueENTRADA: TDateField;
    DEstoqueItemCODPRO: TLongintField;
    DEstoqueItemLCTOI: TLongintField;
    DEstoqueItemQTDE: TBCDField;
    DEstoqueItemTOTAL: TBCDField;
    DEstoqueItemUNITARIO: TBCDField;
    DEstoqueNOLCTO: TLongintField;
    DEstoqueTOTAL: TBCDField;
    DFormaPgtoCODIGO: TLongintField;
    DFormaPgtoDESCRICAO: TStringField;
    DFornecedores: TSQLQuery;
    DFornecedoresBAIRRO: TStringField;
    DFornecedoresCEP: TStringField;
    DFornecedoresCIDADE: TStringField;
    DFornecedoresCODIGO: TLongintField;
    DFornecedoresENDERECO: TStringField;
    DFornecedoresNOME: TStringField;
    DFornecedoresTELEFONE: TStringField;
    DFornecedoresUF: TStringField;
    DGrupos: TSQLQuery;
    DGruposCODIGO: TLongintField;
    DGruposDESCRICAO: TStringField;
    DProdutos: TSQLQuery;
    DFormaPgto: TSQLQuery;
    DProdutosCODGRUPO: TLongintField;
    DProdutosCODIGO: TLongintField;
    DProdutosCUSTO: TBCDField;
    DProdutosDESCRICAO: TStringField;
    DProdutosESTOQUE: TBCDField;
    DProdutosLUCRO: TBCDField;
    DProdutosVENDA: TBCDField;
    DEstoque: TSQLQuery;
    DEstoqueItem: TSQLQuery;
    DVendaItemCODPRO: TLongintField;
    DVendaItemQTDE: TBCDField;
    DVendaItemTOTAL: TBCDField;
    DVendaItemUNITARIO: TBCDField;
    DVendaItemVENDAI: TLongintField;
    DVendas: TSQLQuery;
    DVendasCODCLI: TLongintField;
    DVendasDATAVENDA: TDateField;
    DVendasDESC_ACRES: TBCDField;
    DVendasESTACAO: TStringField;
    DVendasHORAVENDA: TStringField;
    DVendasNOVENDA: TLongintField;
    DVendasOBS: TStringField;
    DVendasPgtoCODPGTO: TLongintField;
    DVendasPgtoVALOR: TBCDField;
    DVendasPgtoVENDAP: TLongintField;
    DVendasSUBTOTAL: TBCDField;
    DVendasTOTAL: TBCDField;
    DVendaItem: TSQLQuery;
    DVendasPgto: TSQLQuery;
    Transacao: TSQLTransaction;
    procedure DClientesAfterPost(DataSet: TDataSet);
    procedure DEstoqueItemAfterPost(DataSet: TDataSet);
    procedure DFormaPgtoAfterPost(DataSet: TDataSet);
    procedure DFornecedoresAfterPost(DataSet: TDataSet);
    procedure DGruposAfterPost(DataSet: TDataSet);
    procedure DProdutosAfterPost(DataSet: TDataSet);
    procedure DEstoqueAfterPost(DataSet: TDataSet);
    procedure DVendaItemAfterPost(DataSet: TDataSet);
    procedure DVendasAfterPost(DataSet: TDataSet);
    procedure DVendasPgtoAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  TabGlobal: TTabGlobal;

implementation

{$R *.lfm}

{ TTabGlobal }

procedure TTabGlobal.DClientesAfterPost(DataSet: TDataSet);
begin
  DClientes.ApplyUpdates;
  Transacao.CommitRetaining;
  DClientes.Refresh;
  DClientes.Close;
  DClientes.SQL.Clear;
  DClientes.SQL.Add('select * FROM CLIENTES');
  DClientes.SQL.Add('order by NOME');
  DClientes.Prepare;
  DClientes.Open;
end;

procedure TTabGlobal.DEstoqueItemAfterPost(DataSet: TDataSet);
begin
  DEstoqueItem.ApplyUpdates;
  Transacao.CommitRetaining;
  DEstoqueItem.Refresh;
end;

procedure TTabGlobal.DFormaPgtoAfterPost(DataSet: TDataSet);
begin
  DFormaPgto.ApplyUpdates;
  Transacao.CommitRetaining;
  DFormaPgto.Refresh;
end;

procedure TTabGlobal.DFornecedoresAfterPost(DataSet: TDataSet);
begin
  DFornecedores.ApplyUpdates;
  Transacao.CommitRetaining;
  DFornecedores.Refresh;
  DFornecedores.Close;
  DFornecedores.SQL.Clear;
  DFornecedores.SQL.Add('select * FROM FORNECEDORES');
  DFornecedores.SQL.Add('order by NOME');
  DFornecedores.Prepare;
  DFornecedores.Open;
end;

procedure TTabGlobal.DGruposAfterPost(DataSet: TDataSet);
begin
  DGrupos.ApplyUpdates;
  Transacao.CommitRetaining;
  DGrupos.Refresh;
end;

procedure TTabGlobal.DProdutosAfterPost(DataSet: TDataSet);
begin
  DProdutos.ApplyUpdates;
  Transacao.CommitRetaining;
  DProdutos.Refresh;
end;

procedure TTabGlobal.DEstoqueAfterPost(DataSet: TDataSet);
begin
  DEstoque.ApplyUpdates;
  Transacao.CommitRetaining;
  DEstoque.Refresh;
end;

procedure TTabGlobal.DVendaItemAfterPost(DataSet: TDataSet);
begin
  DVendaItem.ApplyUpdates;
  Transacao.CommitRetaining;
  DVendaItem.Refresh;
end;

procedure TTabGlobal.DVendasAfterPost(DataSet: TDataSet);
begin
  DVendas.ApplyUpdates;
  Transacao.CommitRetaining;
  DVendas.Refresh;
end;

procedure TTabGlobal.DVendasPgtoAfterPost(DataSet: TDataSet);
begin
  DVendasPgto.ApplyUpdates;
  Transacao.CommitRetaining;
  DVendasPgto.Refresh;
end;

end.

