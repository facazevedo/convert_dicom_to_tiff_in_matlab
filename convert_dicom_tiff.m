% Instructions:
%
% 1. Write the path of the folder where the dicom images are in "path_dcms"
% 2. Write the desired path for the output tiff image in "path_tiff"
% 3. Run the script
%
% Requirement: image processing toolbox

path_dcms = 'C:\Users\fazevedo\Desktop\dicom';
path_tiff = 'C:\Users\fazevedo\Desktop\dicom_tiff';

% --- MAIN ---

% If necessary create "path_diff"
if ~exist(path_tiff, "dir")
    mkdir(path_tiff);
end

% List all the dicom files inside the directory "path_dcms"
list_dcms = dir(fullfile(path_dcms, "*.dcm"));

% Convert each image individually deleting previous versions
for i = 1 : size(list_dcms,1)
    tiff_img = dicomread(fullfile(path_dcms, list_dcms(i).name));
    tiff_img = uint8(255 * mat2gray(tiff_img));
    tiff_name = strrep(list_dcms(i).name, 'dcm', 'tiff');
    if exist(fullfile(path_tiff, tiff_name), 'file')
        delete(fullfile(path_tiff, tif_name));
    end
    imwrite(tiff_img, fullfile(path_tiff, tiff_name));
end
