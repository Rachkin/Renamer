path = File.expand_path(".")+"/targets"
p path
ArrayOfDocumentTypes = [".pdf",".doc",".docx",".txt"]
ArrayOfImageTypes = [".jpd",".png",".jpng",".gif"]
CountOfDocuments = 0
CountOfImages = 0
CountOfOtherFiles = 0
Dir.entries(path).each {|f|
p f
TypeOfFile = f[f.index('.').to_i .. f.length].to_s
if ArrayOfDocumentTypes.include?(TypeOfFile) and File.file?(path+"/"+f)
    CountOfDocuments = CountOfDocuments + 1
    File::rename(path +"/"+ f, path +"/" + '0'*(4-CountOfDocuments.to_s.length)+ CountOfDocuments.to_s + "_document"+ TypeOfFile)
elsif ArrayOfImageTypes.include?(TypeOfFile) and File.file?(path+"/"+f)
    CountOfImages = CountOfImages + 1 
    File::rename(path +"/"+ f, path +"/" + '0'*(4-CountOfImages.to_s.length)+ CountOfImages.to_s + "_image"+ TypeOfFile)
elsif File.file?(path+"/"+f)
    CountOfOtherFiles = CountOfOtherFiles + 1
    File::rename(path +"/"+ f, path +"/" + '0'*(4-CountOfOtherFiles.to_s.length)+ CountOfOtherFiles.to_s + "_other"+ TypeOfFile)
end
}
p "Count Of Documents - " + CountOfDocuments.to_s
p "Count Of Images - " + CountOfImages.to_s
p "Count Of Other Files - " + CountOfOtherFiles.to_s
