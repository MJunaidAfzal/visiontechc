<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Lead;
use Illuminate\Support\Facades\Validator;

class LeadController extends Controller
{
    //
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone_number' => 'required|string|max:20',
            'title' => 'nullable|string|max:255',
            'city' => 'nullable|string|max:255',
            'country' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'client_id' => 'nullable|integer',
            'lead_source_id' => 'nullable|integer',
            'status' => 'nullable|string|max:50',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }

        $lead = Lead::create($request->all());

        return response()->json([
            'message' => 'Lead created successfully',
            'lead' => $lead
        ], 201);
    }

    // Get a specific lead
    // public function show($id)
    // {
    //     $lead = Lead::find($id);

    //     if (!$lead) {
    //         return response()->json([
    //             'message' => 'Lead not found'
    //         ], 404);
    //     }

    //     return response()->json([
    //         'lead' => $lead
    //     ]);
    // }
}
