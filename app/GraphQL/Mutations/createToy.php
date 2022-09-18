<?php

declare(strict_types=1);

namespace App\GraphQL\Mutations;

use App\Models\Image;
use App\Models\Toy;
use App\Models\User;
use Closure;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Mutation;
use Rebing\GraphQL\Support\SelectFields;

class createToy extends Mutation
{
    protected $attributes = [
        'name' => 'createToy',
        'description' => 'A mutation'
    ];

    public function type(): Type
    {
        return Type::listOf(Type::string());
    }

    public function args(): array
    {
        return [
            'toy_name' => [
                'type' => Type::String(),
                'description' => 'name of the toy which you want to exchange'
            ],
            'exchange_to' => [
                'type' => Type::String(),
                'description' => 'name of the toy that you will to exchange your toy'
            ],
            'user_name' => [
                'type' => Type::String(),
                'description' => 'name of every user'
            ],
            'contact' => [
                'type' => Type::String(),
                'description' => 'contact of user'
            ],
            'images' => [
                'type' => Type::listOf(GraphQL::type('Upload')),
                'description' => 'uri image of toy',
                'rules' => ['required']
            ]

        ];
    }


    public function resolve($root, array $args, $context, ResolveInfo $resolveInfo, Closure $getSelectFields)
    {

        $checkuser = User::where('contact', $args['contact'])->get();
        if($checkuser->count() < 1) {
            $user = new User();

            $user->user_name = $args['user_name'];
            $user->contact = $args['contact'];

            $user->save();

            $toy = new Toy();

            $toy->toy_name = $args['toy_name'];
            $toy->status = 1;
            $toy->exchange_to = $args['exchange_to'];
            $toy->user_id = $user->id;

            $toy-> save();
            $files = $args['images'];
            foreach($files as $file){
                $image_ext = $file->getClientOriginalExtension();
                $image_name = $toy->toy_name . rand(0, 10) . "." . $image_ext;


                $image_uri = "http://localhost:8000/storage/toy/" . $image_name;

                $file->storeAs("public/toy/", $image_name);

                $image = new Image();
                $image->toy_uri = $image_uri;
                $image->toy_id = $toy->id ;

                $image->save();
            }

            return ["You and your toy are successfully saved"];
        }else{
            $toy = new Toy();

            $toy->toy_name = $args['toy_name'];
            $toy->status = "active";
            $toy->exchange_to = $args['exchange_to'];
            $toy->user_id = $checkuser[0]->id;

            $toy-> save();
            $files = $args['images'];
            foreach($files as $file){
                $image_ext = $file->getClientOriginalExtension();
                $image_name = $toy->toy_name . rand(0, 10) . "." . $image_ext;


                $image_uri = "http://localhost:8000/storage/toy/" . $image_name;

                $file->storeAs("public/toy/", $image_name);

                $image = new Image();
                $image->toy_uri = $image_uri;
                $image->toy_id = $toy->id ;

                $image->save();
            }

            return ["toy added to your collection"];
        }

    }
}
