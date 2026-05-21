@extends('layouts.app')

@section('content')

<h2>Personnel List</h2>

<a href="{{ route('personnel.create') }}" class="btn btn-primary mb-3">
    + Add New Personnel
</a>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>#</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Sex</th>
            <th>Civil Status</th>
            <th>Employee No</th>
        </tr>
    </thead>

    <tbody>
        @foreach($personnel as $p)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $p->personnel_last_name }}</td>
                <td>{{ $p->personnel_first_name }}</td>
                <td>{{ $p->sex->sex_name }}</td>
                <td>{{ $p->civilStatus->civil_status_name }}</td>
                <td>{{ $p->employee_no }}</td>
            </tr>
        @endforeach
    </tbody>
</table>

@endsection