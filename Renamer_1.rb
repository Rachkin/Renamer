path = File.expand_path(".")+"/targets"
p path
CountOfDocuments = 0
CountOfImages = 0
CountOfOtherFiles = 0
Dir.entries(path).each {|f|
p f
if (f[f.index('.').to_i .. f.length].to_s == ".pdf") or (f[f.index('.').to_i .. f.length].to_s == ".doc") or (f[f.index('.').to_i .. f.length].to_s == ".docx") or (f[f.index('.').to_i .. f.length].to_s == ".txt") and File.file?(path+"/"+f)
    CountOfDocuments = CountOfDocuments + 1


    File::rename(path +"/"+ f, path +"/" + '0'*(4-CountOfDocuments.to_s.length)+ CountOfDocuments.to_s + "_document"+ f[f.index('.').to_i .. f.length].to_s)

elsif (f[f.index('.').to_i .. f.length].to_s == ".jpg") or (f[f.index('.').to_i .. f.length].to_s == ".png") or (f[f.index('.').to_i .. f.length].to_s == ".jpng") or (f[f.index('.').to_i .. f.length].to_s == ".gif") and File.file?(path+"/"+f)
    CountOfImages = CountOfImages + 1 


    File::rename(path +"/"+ f, path +"/" + '0'*(4-CountOfImages.to_s.length)+ CountOfImages.to_s + "_image"+ f[f.index('.').to_i .. f.length].to_s)
elsif File.file?(path+"/"+f)
    CountOfOtherFiles = CountOfOtherFiles + 1

    File::rename(path +"/"+ f, path +"/" + '0'*(4-CountOfOtherFiles.to_s.length)+ CountOfOtherFiles.to_s + "_other"+ f[f.index('.').to_i .. f.length].to_s)
end
}
p "Count Of Documents - " + CountOfDocuments.to_s
p "Count Of Images - " + CountOfImages.to_s
p "Count Of Other Files - " + CountOfOtherFiles.to_s
