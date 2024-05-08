import { createClient } from "@supabase/supabase-js";
import { Database } from "./types";

const SUPABASE_URL = process.env.SUPABASE_URL ? process.env.SUPABASE_URL : "https://kimtuecthichjtenslli.supabase.co";
const SUPABASE_KEY = process.env.SUPABASE_KEY ? process.env.SUPABASE_KEY : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpbXR1ZWN0aGljaGp0ZW5zbGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzAxNTAsImV4cCI6MjAzMDcwNjE1MH0.i8gRNNi684LbanM6Ibxf-rcA5Q5ekcxhX53IHd_53HI";
export const supabase = createClient < Database > (SUPABASE_URL, SUPABASE_KEY);

const load_data = async () => {
  try {
    const { data, error } = await supabase.from("posts").select();
    if (error) throw new Error();
    return data;
  } catch (err) {
    alert("데이터를 불러오지 못했습니다. 다시 시도해주세요.");
    return null;
  }
};

return load_data();