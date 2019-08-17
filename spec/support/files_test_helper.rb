module FilesTestHelper
    def self.image_file(size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
        file = Tempfile.new("faker_placeholdit")
        file.binmode
        file << Net::HTTP.get(URI(Faker::Placeholdit.image(size: size, format: format, background_color: background_color, text_color: text_color, text: text)))
        file.close
      
        ::File.new(file.path)
    end
end