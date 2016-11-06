

%triggerconfig(vid, 'manual');

%start(vid);



%tic

function ACE()

vid = videoinput('winvideo',1);

%fileID = fopen('preimage.txt','w');
%formatSpec = ' %d \n';

%while true
    
    
    snap = getsnapshot(vid);
    %snap = imread('lena.png')
    face = rgb2gray(snap);
    %face = flip(snap,2);
    
    %detector = vision.CascadeObjectDetector;
    %detector.MergeThreshold = 5;
    %bbox = step(detector, snap);
    %subplot(2,2,[1 2]),subimage(snap);  
    hold on;

    %out = insertObjectAnnotation(snap,'rectangle',bbox,'detect');
    %face = imcrop(snap, bbox);
    %bbox;
    
    
    
    %subplot(2,2,3),subimage(face);
    hold on;
    
    eyedetector = vision.CascadeObjectDetector('EyePairBig');
    eyedetector.MergeThreshold = 6  ;

    bboxeyes = step(eyedetector, face);
    
    
    bboxeyes
    bboxeyes = bboxeyes(1,:)
    %bboxeyes = transpose(bboxeyes);
    %bboxeyes = smooth(bboxeyes);
    %bboxeyes = transpose(bboxeyes)
    %for i = 1:4
     %   x = bboxeyes(1,i);
      %  if( x > 125)
       %     bboxeyes(1,i) = 255;
            
        %else  
         %   bboxeyes(1,i) = 0;
        %end
    %end
    %out = insertObjectAnnotation(faceme,'rectangle',bboxeyes,'detecteyes');
    out = imcrop(face, bboxeyes);
    
    eye_col = bboxeyes(1,3);
    eye_row = bboxeyes(1,4);
    im_split = round(eye_col/3)
    mat = eye_row * eye_col;
    perc = 100/75;
    mat = mat /perc;
    mat = round(mat)
    
    %countg = 0;
    x = 23;
    y = 30;
    
    eyeimage = out;
    
    %for p = 1: eye_row
     %   for q = 1: eye_col
      %      fprintf(fileID,file_hand{p,q});
       % end
    %end
    %type preimage.txt
    [temp,countb,countw]= ip(x,y, eye_row,eye_col,eyeimage);
       
    %for i = 1: (bboxeyes(1,3))
     %   for j = 1: (bboxeyes(1,4))
      %      if(temp(i,j) == 0)
       %         countb = countb + 1;
        %    else if(temp(i,j) == 255)
         %           countw = countw +1;
                %else
                 %   countg = countg + 1;
          %      end
           % end
        %end
   % end
    
    
    
    while(countb > mat)
        x = x-2;
        y = y-2;
        [temp,countb,countw]=ip(x,y, eye_row,eye_col,eyeimage);
    end
    while(countw>mat)
            x = x+2;
            y = y+2;
            [temp,countb,countw]=ip(x,y, eye_row,eye_col,eyeimage);
    end
     
    
    for i = 1:eye_row
        for j = 1:im_split
            imone(i,j) = temp(i,j);
        end
        for j = im_split:(im_split*2)
            imtwo(i,j) = temp(i,j);
        end
        for j = (im_split*2):eye_col
            imthr(i,j) = temp(i,j);
        end
    end
         
    
    
    
    %out = imadjust(out);
    %Rmin = 11;
    %Rmax = 30;
    %[centers, radii, metric] = imfindcircles(out, [Rmin Rmax], 'ObjectPolarity','dark');
    point = detectMinEigenFeatures(temp);
    %subplot(2,3,[1 2]),subimage(temp);
    %imshow(temp);
    imshow(imone,imtwo,imthr);
    %subplot(2,3,3),subimage(imone);
    %subplot(2,3,4),subimage(imtwo);
    %subplot(2,3,5),subimage(imthr);
    
    hold on;
    plot(point.selectStrongest(50));
    
end
%fclose('preimage.bin');
%end

%elapsedTime = toc

% Compute the time per frame and effective frame rate.
%timePerFrame = elapsedTime/20
%effectiveFrameRate = 1/timePerFrame
%stop(vid);
%delete(vid);
