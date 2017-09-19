function clickDown ( objectHandle , eventData )
axesHandles  = get(objectHandle,'Parent');
coordinate = get(axesHandles,'CurrentPoint');
point=coordinate(1,1:2);
disp(point);
disp(eventData);