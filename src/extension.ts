import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
  let disposable = vscode.commands.registerCommand(
    'karate-formatter.formatFile',
    async () => {
      const editor = vscode.window.activeTextEditor;
      if (!editor) {
        return;
      }
      await vscode.languages.setTextDocumentLanguage(
        editor.document,
        'feature'
      );
      setTimeout(async () => {
        await vscode.commands.executeCommand('editor.action.format');
      }, 500);
      setTimeout(async () => {
        await vscode.languages.setTextDocumentLanguage(
          editor.document,
          'karate'
        );
        await vscode.window.showInformationMessage('Formatting done');
      }, 750);
    }
  );

  context.subscriptions.push(disposable);
}

export function deactivate() {}
