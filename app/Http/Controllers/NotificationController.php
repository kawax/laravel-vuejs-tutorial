<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function __invoke()
    {
        return [
            [
                'id'      => 1,
                'message' => 'message 1',
            ],
            [
                'id'      => 2,
                'message' => 'message 2',
            ],
        ];
    }
}
