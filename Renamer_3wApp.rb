path = File.expand_path(".")+"/targets"
p path
ArrayOfDocumentTypes = [".pdf",".doc",".docx",".txt"]
ArrayOfImageTypes = [".jpd",".png",".jpng",".gif"]
ArrayOfAppTypes = [".exe",".bat",".com"]
CountOfDocuments = 0
CountOfApps = 0
CountOfImages = 0
CountOfOtherFiles = 0
Dir.entries(path).each {|f|
p f
TypeOfFile = f[f.index('.').to_i .. f.length].to_s
if File.file?(path+"/"+f)
    if ArrayOfDocumentTypes.include?(TypeOfFile)
        CountOfDocuments = CountOfDocuments + 1
            File::rename(path +"/"+ f, path +"/" + '0'*(4 - CountOfDocuments.to_s.length)+ CountOfDocuments.to_s + "_document"+ TypeOfFile)
    elsif ArrayOfAppTypes.include?(TypeOfFile)
        CountOfApps = CountOfApps + 1 
        File::rename(path +"/"+ f, path +"/" + '0'*(4 - CountOfApps.to_s.length)+ CountOfApps.to_s + "_app"+ TypeOfFile)
    elsif ArrayOfImageTypes.include?(TypeOfFile)
        CountOfImages = CountOfImages + 1 
        File::rename(path +"/"+ f, path +"/" + '0'*(4 - CountOfImages.to_s.length)+ CountOfImages.to_s + "_image"+ TypeOfFile)
    else
        CountOfOtherFiles = CountOfOtherFiles + 1
        File::rename(path +"/"+ f, path +"/" + '0'*(4 - CountOfOtherFiles.to_s.length)+ CountOfOtherFiles.to_s + "_other"+ TypeOfFile)
    end
end
}
p "Count Of Documents - " + CountOfDocuments.to_s
p "Count Of Apps - " + CountOfApps.to_s
p "Count Of Images - " + CountOfImages.to_s
p "Count Of Other Files - " + CountOfOtherFiles.to_s
gets
