#!/usr/bin/env ruby
path = File.expand_path(".")
Dir.mkdir(path + "/targets") if !File.directory?(path + "/targets")
Dir.mkdir(path + "/at_time") if !File.directory?(path + "/at_time")
array_of_document_types = [".pdf",".doc",".docx",".txt"]
array_of_image_types = [".jpg",".png",".jpeg",".gif"]
count_of_documents = 0
count_of_images = 0
count_of_other_files = 0
files = Dir.entries(path + "/targets")
files.each do |f|
    if File.file?(path + "/targets" + "/" + f)
        type_of_file = f[f.rindex('.').to_i .. f.length].to_s
        case
        when array_of_document_types.include?(type_of_file)
            count_of_documents += 1
            new_file_name = "document_" + count_of_documents.to_s.rjust(4, "0") + type_of_file
        when array_of_image_types.include?(type_of_file)
            count_of_images += 1 
            new_file_name = "image_" + count_of_images.to_s.rjust(4, "0") + type_of_file
        else
            count_of_other_files += 1
            new_file_name = "other_" + count_of_other_files.to_s.rjust(4, "0") + type_of_file
        end
        File::rename(path +  "/targets/" + f, path + "/at_time/" + new_file_name)
    end
end


files = Dir.entries(path + "/at_time")
files.each do |f|
type_of_file = f[f.rindex('.').to_i .. f.length].to_s
    if File.file?(path + "/at_time/"+ f)
        File::rename(path + "/at_time/" + f, path + "/targets/" + f)
    end
end
Dir.rmdir(path + "/at_time")
p "Count Of Documents - " + count_of_documents.to_s
p "Count Of Images - " + count_of_images.to_s
p "Count Of Other Files - " + count_of_other_files.to_s

gets