path = File.expand_path(".")+"/targets"
p path
array_of_document_types = [".pdf",".doc",".docx",".txt"]
array_of_image_types = [".jpd",".png",".jpng",".gif"]
count_of_documents = 0
count_of_images = 0
count_of_other_files = 0
Dir.entries(path).each {|f|
p f
type_of_file = f[f.index('.').to_i .. f.length].to_s
if File.file?(path+"/"+f)
    if array_of_document_types.include?(type_of_file)
        count_of_documents = count_of_documents + 1
            File::rename(path +"/"+ f, path +"/" + '0'*(4 - count_of_documents.to_s.length)+ count_of_documents.to_s + "_document"+ type_of_file)
    elsif array_of_image_types.include?(type_of_file)
        count_of_images = count_of_images + 1 
        File::rename(path +"/"+ f, path +"/" + '0'*(4 - count_of_images.to_s.length)+ count_of_images.to_s + "_image"+ type_of_file)
    else
        count_of_other_files = count_of_other_files + 1
        File::rename(path +"/"+ f, path +"/" + '0'*(4 - count_of_other_files.to_s.length)+ count_of_other_files.to_s + "_other"+ TypeOfFile)
    end
end
}
p "Count Of Documents - " + count_of_documents.to_s
p "Count Of Images - " + count_of_images.to_s
p "Count Of Other Files - " + count_of_other_files.to_s
gets
