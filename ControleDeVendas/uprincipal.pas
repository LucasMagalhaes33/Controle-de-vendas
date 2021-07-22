unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
   uses uCliente, uFornecedor, uGrupo;
{$R *.lfm}

   { TfrmPrincipal }

   procedure TfrmPrincipal.MenuItem2Click(Sender: TObject);
   begin
     frmClientes.ShowModal;
   end;

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
    frmFornecedor.ShowModal;
end;

procedure TfrmPrincipal.MenuItem4Click(Sender: TObject);
begin
  frmGrupo.ShowModal;
end;

end.

