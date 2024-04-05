<?php

namespace Database\Seeders;

use App\Models\Stream;
use Illuminate\Database\Seeder;

class StreamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $stations = [
            // 100%NL stations
            '100%NL' => [
                'id' => '9b2813c7-6f5d-4af4-bd7a-23a64a7b9d87',
                'stream_url' => 'https://stream.100p.nl/100pctnl.mp3',
                'image_url' => 'https://example.com/100pctnl_image.jpg',
            ],
            '100%NL - Feest' => [
                'id' => 'd44c89f7-91f8-45a2-8a0d-5702f23f6b82',
                'stream_url' => 'https://stream.100p.nl/web01_mp3',
                'image_url' => 'https://example.com/feest_image.jpg',
            ],
            '100%NL - NL Non-Stop' => [
                'id' => '3e3eeb96-6d80-4f9d-9674-9448bfb8723d',
                'stream_url' => 'https://stream.100p.nl/web02_mp3',
                'image_url' => 'https://example.com/feest_image.jpg',
            ],
            '100%NL - Liefde' => [
                'id' => '0ef5b320-0f18-471e-b045-1e8b8e9d754a',
                'stream_url' => 'https://stream.100p.nl/web03.mp3',
                'image_url' => 'https://example.com/100pctnl_image.jpg',
            ],
            '100%NL - NL Nederpop' => [
                'id' => '4d78989a-633c-4f20-8f36-4ed30ddfe4b7',
                'stream_url' => 'https://stream.100p.nl/web04.mp3',
                'image_url' => 'https://example.com/100pctnl_image.jpg',
            ],
            '100%NL - Songfestival' => [
                'id' => 'b010985c-c836-44cc-8c3f-9363bb3fe504',
                'stream_url' => 'https://stream.100p.nl/web05_mp3',
                'image_url' => 'https://example.com/feest_image.jpg',
            ],
            '100%NL - Puur' => [
                'id' => '2cc14b27-4f91-4e42-bc72-c7e558351aab',
                'stream_url' => 'https://stream.100p.nl/web06_mp3',
                'image_url' => 'https://example.com/feest_image.jpg',
            ],

            // 538 stations
            '538 Radio' => [
                'id' => 'a16c1a7f-531e-4934-aac7-080e0061a3dd',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/RADIO538.mp3',
                'image_url' => 'https://example.com/538_radio_image.jpg',
            ],
            '538 Classics' => [
                'id' => 'e5c9f4c8-9d9b-40b3-b56f-372db4f974d1',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR08.mp3',
                'image_url' => 'https://example.com/538_classics_image.jpg',
            ],
            '538 Dance Dept.' => [
                'id' => '76162a88-5a20-4647-98f4-19e2c36f9350',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR01.mp3',
                'image_url' => 'https://example.com/538_dance_dept_image.jpg',
            ],
            '538 Hitzone' => [
                'id' => '8732a3ad-bdcf-439d-9207-c87820d4d0f7',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR11.mp3',
                'image_url' => 'https://example.com/538_hitzone_image.jpg',
            ],
            '538 Ibiza' => [
                'id' => 'e847862d-5bd4-43db-8e49-6b3402510ef1',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR19.mp3',
                'image_url' => 'https://example.com/538_ibiza_image.jpg',
            ],
            '538 Non-Stop' => [
                'id' => 'ee89de7e-97ad-4b42-8814-13c99d50a18e',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR09.mp3',
                'image_url' => 'https://example.com/538_non_stop_image.jpg',
            ],
            '538 Party' => [
                'id' => 'aa0c7f47-2ba9-4de8-8a32-1da5e0799b3e',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR16.mp3',
                'image_url' => 'https://example.com/538_party_image.jpg',
            ],
            '538 Top 50' => [
                'id' => 'c7a8a9a9-637a-4a7d-bae2-66f525eaf75a',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR13.mp3',
                'image_url' => 'https://example.com/538_top_50_image.jpg',
            ],
            '538 Die Verrückte' => [
                'id' => '4898f725-842d-429b-89b9-5ccafea5c7a1',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR21.mp3',
                'image_url' => 'https://example.com/538_die_verruckte_image.jpg',
            ],
            '538 Zomer' => [
                'id' => '6e2c5429-c3eb-437b-8a52-4c0e2a3b8712',
                'stream_url' => 'https://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR06.mp3',
                'image_url' => 'https://example.com/538_zomer_image.jpg',
            ],
        ];

        foreach ($stations as $title => $data) {
            Stream::updateOrCreate(
                [
                    'id' => $data['id']
                ],
                [
                'user_id' => 'deadbeef-a123-b456-c789-deadbaadf00d',
                'title' => $title,
                'stream_url' => $data['stream_url'],
                'image_url' => $data['image_url'],
            ]);
        }
    }
}
