controladdin testaddin
{
    RequestedHeight = 450;
    //MinimumHeight = 2000;
    //MaximumHeight = 300;
    //RequestedWidth = 700;
    //MinimumWidth = 700;
    //MaximumWidth = 700;
    VerticalStretch = true;
    //VerticalShrink = false;
    HorizontalStretch = true;
    //HorizontalShrink = true;
    Scripts = 'controls.js';
    StartupScript = 'start.js';
    StyleSheets = 'controls.css';
    event Ready();
    event ButtonPressed(buttonText: Text);
    event Pong(id: Text);
    procedure addButton(id: Text; buttonName: Text; callText: Text);
    procedure modifyStyle(id: text; style: Text; value: Text);
    procedure Ping(id: Text; timeout: Integer);

}
