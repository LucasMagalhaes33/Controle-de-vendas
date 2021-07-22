unit uCliente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ComCtrls, ExtCtrls, DBGrids;

type

  { TfrmClientes }

  TfrmClientes = class(TForm)
    btnPesquisa: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    TABELA: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btnPesquisaClick(Sender: TObject);
  private

  public

  end;

var
  frmClientes: TfrmClientes;

implementation
  uses uTABGLOBAL;
{$R *.lfm}

  { TfrmClientes }

  procedure TfrmClientes.btnPesquisaClick(Sender: TObject);
  begin
    TabGlobal.DClientes.Close;
    TabGlobal.DClientes.SQL.Clear;
    TabGlobal.DClientes.SQL.Add('select * from CLIENTES');
    TabGlobal.DClientes.SQL.Add('Where NOME like :cPesquisa');
    TabGlobal.DClientes.SQL.Add('order by NOME');
    TabGlobal.DClientes.ParamByName('cPesquisa').AsString:='%'+edtPesquisa.Text+'%';
    TabGlobal.DClientes.Prepare;
    TabGlobal.DClientes.Open;
  end;

end.

