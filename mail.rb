require "postmark"

def send
  if ARGV.length == 0
    puts "Error: Please provide an email address to send the message"
    return false
  end

  client = Postmark::ApiClient.new(ENV["POSTMARK_API_TOKEN"])
  from_address = ENV["FROM_ADDRESS"]
  to_address = ARGV[0]
  subject = ARGV[1]
  body = File.read("message.txt")

  res = client.deliver({
    from: from_address,
    to: to_address,
    subject: subject,
    text_body: body,
    track_opens: true})

  puts "---> Sending to #{to_address} from #{from_address}"
  puts res

end

#
# Run
#

send
