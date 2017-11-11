path = File.expand_path(".")+"/targets"
array_of_document_types = [".pdf",".doc",".docx",".txt"]
array_of_image_types = [".jpg",".png",".jpeg",".gif"]
count_of_documents = 0
count_of_images = 0
count_of_other_files = 0
files = Dir.entries(path)
files.each do |f|
type_of_file = f[f.rindex('.').to_i .. f.length].to_s
    if File.file?(path+"/"+f)
        case
        when array_of_document_types.include?(type_of_file)
            count_of_documents += 1
            File::rename(path +"/"+ f, 
                         path +"/" + count_of_documents.to_s.rjust(4, "0") + "_document"+ type_of_file)
        when array_of_image_types.include?(type_of_file)
            count_of_images += 1 
            File::rename(path +"/"+ f,
                         path +"/" + count_of_images.to_s.rjust(4, "0") + "_image"+ type_of_file)
        else
            count_of_other_files += 1
            File::rename(path +"/"+ f, 
                         path +"/" + count_of_other_files.to_s.rjust(4, "0") + "_other"+ type_of_file)
        end
    end
end
p "Count Of Documents - " + count_of_documents.to_s
p "Count Of Images - " + count_of_images.to_s
p "Count Of Other Files - " + count_of_other_files.to_s
gets
