%w(rubygems 
   sinatra 
   espeak-ruby
   digest/sha1).each { |l| require l }

include ESpeak

get '/' do
  redirect 'http://rors.org/2010/10/21/espeak-ruby.html', 301
end

get '/tts' do
  filename = "tmp/#{Digest::SHA1.hexdigest(params.to_s)}.mp3"
  espeak(filename, params) # unless filename exists
  [200, {'Content-type' => 'audio/mpeg'}, File.read(filename)]
end