% Custom callback that gets called when the user clicks on the image in the handles.axesImage axes.
function MyCustomAxesButtonDownFunction(dummy1, dummy2, handles)
	try
		% Load another, random splash image into the axes.
		LoadSplashImage(handles, handles.axesImage);
        disp('click');
	catch ME
		errorMessage = sprintf('Error in function MyCustomAxesButtonDownFunction.\n\nError Message:\n%s', ME.message);
		fprintf('%s\n', errorMessage);
		WarnUser(errorMessage);
	end
	return; % from MyCustomAxesButtonDownFunction