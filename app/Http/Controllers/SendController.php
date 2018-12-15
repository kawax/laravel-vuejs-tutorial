<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Notifications\TestNotification;

class SendController extends Controller
{
    public function __invoke(Request $request)
    {
        $request->user()->notify(new TestNotification);

        return [
            'status' => 'OK',
        ];
    }
}
