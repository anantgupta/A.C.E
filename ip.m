function [temp, countb, countw]=ip(x,y, eye_row,eye_col, eyeimage)

%fileID = fopen('preimage.txt');
%out = fread(fileID);
blk = 0;
wht = 0;
i=1;
j=1;

for i = 1: (eye_row + 1)
        for j = 1: (eye_col + 1)
            if(eyeimage(i,j) < x)
                eyeimage(i,j)=0;
                blk = blk+1;
            %else if (eyeimage(i,j) > x && eyeimage(i,j) < y)
             %   eyeimage(i,j)=125;
                else
                    eyeimage(i,j) = 255;
                    wht = wht + 1;
              %  end     
            end
        end
end

temp=eyeimage;

countb = blk
countw = wht

end


