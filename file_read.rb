class FileRead
    def initialize(filename,modeOfOpen)
        @filename = File.open(filename,modeOfOpen)
    end

    def readFile
        puts @filename.readlines()
    end
end

obj1 = FileRead.new("temp.txt","r")
obj1.readFile