const supabase_url = "https://kimtuecthichjtenslli.supabase.co";
const supabase_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpbXR1ZWN0aGljaGp0ZW5zbGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzAxNTAsImV4cCI6MjAzMDcwNjE1MH0.i8gRNNi684LbanM6Ibxf-rcA5Q5ekcxhX53IHd_53HI";
const client = supabase.createClient(supabase_url, supabase_key);

async function refrash_mappins() {
  let { data: record, error } = await client.from("Mappins").select("*");
  console.log('record', record);
};

refrash_mappins();