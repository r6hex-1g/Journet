export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[]

export interface Database {
  public: {
    Tables: {
      Mappins: {
        Row: {
          pin_ID: number,
          building_name: string,
          open_hours: string,
          break_time: string,
          last_order_time: string,
          instagram: string,
          call_number: string,
          street_address: string,
          address: string,
          info_link: string,
          latitude: string,
          longitude: string,
          category: string,
          hashtag: string,
          reservation_availability: string,
          deilvery_availability: boolean | null,
          packaging_availability: boolean | null,
          parking_lot_availability: boolean | null,
          bathroom_availability: boolean | null,
          wifi_availability: boolean | null,
          other_facilities: string,
          desciption: string,
          writer: string,
          write_time: Date,
          edit_time: Date,
          othet_info: string
        }

        Insert: {
          building_name: string,
          open_hours: string,
          break_time: string,
          last_order_time: string,
          instagram: string,
          call_number: string,
          street_address: string,
          address: string,
          info_link: string,
          latitude: string,
          longitude: string,
          category: string,
          hashtag: string,
          reservation_availability: string,
          deilvery_availability?: boolean | null,
          packaging_availability?: boolean | null,
          parking_lot_availability?: boolean | null,
          bathroom_availability?: boolean | null,
          wifi_availability?: boolean | null,
          other_facilities: string,
          desciption: string,
        }

        Update: {
          pin_ID?: number,
          building_name?: string,
          open_hours?: string,
          break_time?: string,
          last_order_time?: string,
          instagram?: string,
          call_number?: string,
          street_address?: string,
          address?: string,
          info_link?: string,
          latitude?: string,
          longitude?: string,
          category?: string,
          hashtag?: string,
          reservation_availability?: string,
          deilvery_availability?: boolean | null,
          packaging_availability?: boolean | null,
          parking_lot_availability?: boolean | null,
          bathroom_availability?: boolean | null,
          wifi_availability?: boolean | null,
          other_facilities?: string,
          desciption?: string,
          writer?: string,
          write_time?: Date,
          edit_time?: Date,
          othet_info?: string
        }
      }
    }
  }
}