program SVENDAS;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uPrincipal, uTABGLOBAL, uCliente, uFornecedor, uGrupo
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TTabGlobal, TabGlobal);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmFornecedor, frmFornecedor);
  Application.CreateForm(TfrmGrupo, frmGrupo);
  Application.Run;
end.

