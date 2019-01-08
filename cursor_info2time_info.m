function time_info = cursor_info2time_info (cursor_info) 

for k=1:length(cursor_info(:))
    time_info(k) = cursor_info(k).Position(1,1);
end 


end 