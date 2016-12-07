package com.mia.formation.generation.ui;

import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;

public class CompteView extends Shell {
		private Button btnafficherOperation;
	private Button btnquitter;


	/**
	 * Create the shell.
	 * @param display
	 */
	public CompteView(Display display) {
		super(display, SWT.SHELL_TRIM);
		createContents();
	}
	
	/**
	 * Create contents of the shell.
	 */
	protected void createContents() {
		setText("CompteView");
		setSize(450, 300);
		
		setLayout(new GridLayout(2, false));
		
		Group grpButtons = new Group(this, SWT.NONE);
		grpButtons.setLayout(new GridLayout(2, false));
		grpButtons.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true, 2, 1));
		
				btnafficherOperation = new Button(grpButtons, SWT.NONE);
		btnafficherOperation.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, true, 1, 1));
		btnafficherOperation.setText("afficherOperation");
		btnafficherOperation.addSelectionListener(new SelectionAdapter(){
		        public void widgetSelected(SelectionEvent event)
		        {
		          afficherOperation();
		        }
		      });

		btnquitter = new Button(grpButtons, SWT.NONE);
		btnquitter.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, true, 1, 1));
		btnquitter.setText("quitter");
		btnquitter.addSelectionListener(new SelectionAdapter(){
		        public void widgetSelected(SelectionEvent event)
		        {
		          quitter();
		        }
		      });


	}
	
	@Override
	public void checkSubclass(){
		
	}
	
	public void afficherOperation() {
		// Start of user code for afficherCompte
		// End of user code
	}
	public void quitter() {
		// Start of user code for afficherCompte
		// End of user code
	}
	
}