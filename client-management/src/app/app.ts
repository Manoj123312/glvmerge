import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

interface Client {
  name: string;
  email: string;
  address: string;
}

interface Meeting {
  topic: string;
  numberOfPeople: number;
  startTime: string;
  clientEmail: string;
}

@Component({
  selector: 'app-root',
  imports: [CommonModule, FormsModule],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly projectTitle = 'Client Management Portal';

  protected clients: Client[] = [];
  protected meetings: Meeting[] = [];

  protected clientForm = {
    name: '',
    email: '',
    address: '',
    password: '',
    repeatPassword: ''
  };

  protected meetingForm = {
    topic: '',
    numberOfPeople: 1,
    startTime: '',
    clientEmail: ''
  };

  protected clientMessage = '';
  protected meetingMessage = '';

  protected registerClient(): void {
    this.clientMessage = '';
    if (this.clientForm.password !== this.clientForm.repeatPassword) {
      this.clientMessage = 'Passwords do not match.';
      return;
    }

    this.clients.unshift({
      name: this.clientForm.name.trim(),
      email: this.clientForm.email.trim(),
      address: this.clientForm.address.trim()
    });

    this.clientMessage = 'Client registered successfully.';
    this.clientForm = {
      name: '',
      email: '',
      address: '',
      password: '',
      repeatPassword: ''
    };
  }

  protected scheduleMeeting(): void {
    this.meetingMessage = '';

    this.meetings.unshift({
      topic: this.meetingForm.topic.trim(),
      numberOfPeople: this.meetingForm.numberOfPeople,
      startTime: this.meetingForm.startTime,
      clientEmail: this.meetingForm.clientEmail
    });

    this.meetingMessage = 'Meeting scheduled successfully.';
    this.meetingForm = {
      topic: '',
      numberOfPeople: 1,
      startTime: '',
      clientEmail: ''
    };
  }
}
