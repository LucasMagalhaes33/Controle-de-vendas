unit uGrupo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, DBGrids, DBCtrls;

type

  { TfrmGrupo }

  TfrmGrupo = class(TForm)
    btnPesquisa: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    TABELA: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btnPesquisaClick(Sender: TObject);
  private

  public

  end;

var
  frmGrupo: TfrmGrupo;

implementation
    uses uTABGLOBAL;
{$R *.lfm}

    { TfrmGrupo }

    procedure TfrmGrupo.btnPesquisaClick(Sender: TObject);
    begin
      TabGlobal.DGrupos.Close;
      TabGlobal.DGrupos.SQL.Clear;
      TabGlobal.DGrupos.SQL.Add('select * from GRUPOS');
      TabGlobal.DGrupos.SQL.Add('Where DESCRICAO like :cPesquisa');
      TabGlobal.DGrupos.SQL.Add('order by DESCRICAO');
      TabGlobal.DGrupos.ParamByName('cPesquisa').AsString:='%'+edtPesquisa.Text+'%';
      TabGlobal.DGrupos.Prepare;
      TabGlobal.DGrupos.Open;
    end;

end.

