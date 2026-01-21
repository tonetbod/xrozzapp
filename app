<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Firebase Dart Web App</title>
    
    <!-- Firebase SDKs (Version 9 - Modular) -->
    <script type="module">
        // Import Firebase modules
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-app.js";
        import { getAuth } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-auth.js";
        import { getFirestore } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-firestore.js";
        import { getStorage } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-storage.js";
        import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-analytics.js";
        
        // Your web app's Firebase configuration
        // REPLACE WITH YOUR ACTUAL CONFIG FROM FIREBASE CONSOLE
        const firebaseConfig = {
            apiKey: "AIzaSyBxVg7EXAMPLE-REPLACE-THIS",
            authDomain: "your-project-id.firebaseapp.com",
            projectId: "your-project-id",
            storageBucket: "your-project-id.appspot.com",
            messagingSenderId: "123456789012",
            appId: "1:123456789012:web:abc123def456",
            measurementId: "G-EXAMPLE123"
        };

        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const auth = getAuth(app);
        const db = getFirestore(app);
        const storage = getStorage(app);
        const analytics = getAnalytics(app);
        
        // Make Firebase available globally for Dart interop
        window.firebaseApp = app;
        window.firebaseAuth = auth;
        window.firebaseFirestore = db;
        window.firebaseStorage = storage;
        window.firebaseAnalytics = analytics;
        
        console.log("Firebase initialized successfully!");
    </script>
    
    <!-- OR Alternative: Use Compat version (easier for beginners) -->
    <!-- 
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-auth-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-firestore-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-storage-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-analytics-compat.js"></script>
    <script>
        // Your web app's Firebase configuration
        const firebaseConfig = {
            apiKey: "AIzaSyBxVg7EXAMPLE-REPLACE-THIS",
            authDomain: "your-project-id.firebaseapp.com",
            projectId: "your-project-id",
            storageBucket: "your-project-id.appspot.com",
            messagingSenderId: "123456789012",
            appId: "1:123456789012:web:abc123def456",
            measurementId: "G-EXAMPLE123"
        };

        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        console.log("Firebase initialized!");
    </script>
    -->
    
    <!-- Styles -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 900px;
            overflow: hidden;
            min-height: 500px;
        }
        
        .header {
            background: linear-gradient(90deg, #4f46e5, #7c3aed);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 1.1rem;
        }
        
        .content {
            display: flex;
            min-height: 400px;
        }
        
        .sidebar {
            width: 300px;
            background: #f8fafc;
            padding: 30px;
            border-right: 1px solid #e2e8f0;
        }
        
        .main-content {
            flex: 1;
            padding: 30px;
        }
        
        .firebase-status {
            background: #10b981;
            color: white;
            padding: 12px 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(16, 185, 129, 0.3);
        }
        
        .status-inactive {
            background: #ef4444;
            box-shadow: 0 4px 6px rgba(239, 68, 68, 0.3);
        }
        
        .auth-section, .firestore-section, .storage-section {
            margin-bottom: 30px;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            border: 1px solid #e2e8f0;
        }
        
        h2 {
            color: #1e293b;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        h2 i {
            color: #4f46e5;
        }
        
        .input-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #475569;
            font-weight: 500;
        }
        
        input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        input:focus {
            outline: none;
            border-color: #4f46e5;
        }
        
        button {
            background: #4f46e5;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
        }
        
        button:hover {
            background: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(79, 70, 229, 0.3);
        }
        
        button:active {
            transform: translateY(0);
        }
        
        button.secondary {
            background: #64748b;
        }
        
        button.secondary:hover {
            background: #475569;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        .button-group button {
            flex: 1;
        }
        
        .output {
            margin-top: 20px;
            padding: 15px;
            background: #f1f5f9;
            border-radius: 8px;
            min-height: 60px;
            border: 1px dashed #cbd5e1;
            font-family: monospace;
            white-space: pre-wrap;
            word-wrap: break-word;
            max-height: 200px;
            overflow-y: auto;
        }
        
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid #f3f3f3;
            border-top: 3px solid #4f46e5;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-right: 10px;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .user-info {
            background: linear-gradient(90deg, #dbeafe, #f0f9ff);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .footer {
            text-align: center;
            padding: 20px;
            color: #64748b;
            font-size: 0.9rem;
            border-top: 1px solid #e2e8f0;
            background: #f8fafc;
        }
        
        @media (max-width: 768px) {
            .content {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                border-right: none;
                border-bottom: 1px solid #e2e8f0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔥 Firebase Dart Web</h1>
            <p>Firebase integration with Dart for Web applications</p>
        </div>
        
        <div class="content">
            <div class="sidebar">
                <div id="firebaseStatus" class="firebase-status status-inactive">
                    <span class="loading"></span>Initializing Firebase...
                </div>
                
                <div class="auth-section">
                    <h2><i>👤</i> Authentication</h2>
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" placeholder="user@example.com" value="test@example.com">
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" placeholder="Password" value="password123">
                    </div>
                    <div class="button-group">
                        <button onclick="signIn()">Sign In</button>
                        <button onclick="signUp()" class="secondary">Sign Up</button>
                    </div>
                    <button onclick="signOut()">Sign Out</button>
                </div>
                
                <div class="user-info" id="userInfo" style="display: none;">
                    <h3>👋 Welcome!</h3>
                    <p id="userEmail"></p>
                    <p id="userId"></p>
                </div>
            </div>
            
            <div class="main-content">
                <div class="firestore-section">
                    <h2><i>📄</i> Firestore Database</h2>
                    <div class="input-group">
                        <label for="collectionName">Collection Name</label>
                        <input type="text" id="collectionName" placeholder="users" value="test_collection">
                    </div>
                    <div class="input-group">
                        <label for="documentData">Document Data (JSON)</label>
                        <input type="text" id="documentData" placeholder='{"name": "John", "age": 30}' value='{"name": "Dart User", "timestamp": ""}'>
                    </div>
                    <div class="button-group">
                        <button onclick="addToFirestore()">Add Document</button>
                        <button onclick="readFromFirestore()" class="secondary">Read Documents</button>
                    </div>
                </div>
                
                <div class="storage-section">
                    <h2><i>💾</i> Firebase Storage</h2>
                    <div class="input-group">
                        <label for="fileUpload">Upload File</label>
                        <input type="file" id="fileUpload" accept="image/*,.pdf,.txt">
                    </div>
                    <div class="button-group">
                        <button onclick="uploadFile()">Upload File</button>
                        <button onclick="listFiles()" class="secondary">List Files</button>
                    </div>
                </div>
                
                <h2><i>📊</i> Output Console</h2>
                <div class="output" id="output">
                    // Output will appear here
                    App initialized. Waiting for Firebase...
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>Firebase Web with Dart | Created with ❤️ for developers</p>
            <p>Make sure to replace Firebase config with your own credentials</p>
        </div>
    </div>

    <!-- Dart compiled JavaScript -->
    <script defer src="main.dart.js"></script>
    
    <!-- JavaScript for Firebase operations -->
    <script>
        // Update Firebase status
        function updateFirebaseStatus(connected) {
            const statusElement = document.getElementById('firebaseStatus');
            if (connected) {
                statusElement.innerHTML = '✅ Firebase Connected!';
                statusElement.classList.remove('status-inactive');
                logOutput('Firebase initialized successfully!');
            } else {
                statusElement.innerHTML = '<span class="loading"></span> Connecting to Firebase...';
                statusElement.classList.add('status-inactive');
            }
        }
        
        // Log output to the console div
        function logOutput(message) {
            const output = document.getElementById('output');
            const timestamp = new Date().toLocaleTimeString();
            output.innerHTML = `[${timestamp}] ${message}\n` + output.innerHTML;
        }
        
        // Display user info
        function displayUserInfo(user) {
            const userInfo = document.getElementById('userInfo');
            if (user) {
                userInfo.style.display = 'block';
                document.getElementById('userEmail').textContent = `Email: ${user.email}`;
                document.getElementById('userId').textContent = `UID: ${user.uid.substring(0, 12)}...`;
            } else {
                userInfo.style.display = 'none';
            }
        }
        
        // Firebase Auth Functions
        async function signIn() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            try {
                logOutput(`Signing in with: ${email}`);
                const userCredential = await window.firebaseAuth.signInWithEmailAndPassword(
                    window.firebaseAuth, 
                    email, 
                    password
                );
                logOutput(`✅ Signed in: ${userCredential.user.email}`);
                displayUserInfo(userCredential.user);
            } catch (error) {
                logOutput(`❌ Sign in error: ${error.message}`);
            }
        }
        
        async function signUp() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            try {
                logOutput(`Creating account for: ${email}`);
                const userCredential = await window.firebaseAuth.createUserWithEmailAndPassword(
                    window.firebaseAuth,
                    email,
                    password
                );
                logOutput(`✅ Account created: ${userCredential.user.email}`);
                displayUserInfo(userCredential.user);
            } catch (error) {
                logOutput(`❌ Sign up error: ${error.message}`);
            }
        }
        
        async function signOut() {
            try {
                await window.firebaseAuth.signOut(window.firebaseAuth);
                logOutput('✅ Signed out successfully');
                displayUserInfo(null);
            } catch (error) {
                logOutput(`❌ Sign out error: ${error.message}`);
            }
        }
        
        // Firestore Functions
        async function addToFirestore() {
            const collectionName = document.getElementById('collectionName').value;
            const dataInput = document.getElementById('documentData').value;
            
            try {
                const data = JSON.parse(dataInput);
                data.timestamp = new Date().toISOString();
                
                const docRef = await addDoc(
                    collection(window.firebaseFirestore, collectionName),
                    data
                );
                logOutput(`✅ Document added with ID: ${docRef.id}`);
            } catch (error) {
                logOutput(`❌ Firestore error: ${error.message}`);
            }
        }
        
        async function readFromFirestore() {
            const collectionName = document.getElementById('collectionName').value;
            
            try {
                const querySnapshot = await getDocs(
                    collection(window.firebaseFirestore, collectionName)
                );
                logOutput(`📄 Found ${querySnapshot.size} documents:`);
                querySnapshot.forEach((doc) => {
                    logOutput(`  - ${doc.id}: ${JSON.stringify(doc.data())}`);
                });
            } catch (error) {
                logOutput(`❌ Firestore read error: ${error.message}`);
            }
        }
        
        // Storage Functions
        async function uploadFile() {
            const fileInput = document.getElementById('fileUpload');
            if (!fileInput.files[0]) {
                logOutput('❌ Please select a file first');
                return;
            }
            
            const file = fileInput.files[0];
            const storageRef = ref(window.firebaseStorage, `uploads/${file.name}`);
            
            try {
                logOutput(`📤 Uploading: ${file.name} (${(file.size / 1024).toFixed(2)} KB)`);
                const snapshot = await uploadBytes(storageRef, file);
                const downloadURL = await getDownloadURL(snapshot.ref);
                logOutput(`✅ File uploaded: ${downloadURL}`);
            } catch (error) {
                logOutput(`❌ Upload error: ${error.message}`);
            }
        }
        
        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            // Check if Firebase is loaded
            if (window.firebaseApp) {
                updateFirebaseStatus(true);
                
                // Listen for auth state changes
                onAuthStateChanged(window.firebaseAuth, (user) => {
                    displayUserInfo(user);
                });
            } else {
                updateFirebaseStatus(false);
                logOutput('Firebase not loaded. Check your configuration.');
            }
        });
    </script>
    
    <!-- Import Firebase functions for JavaScript usage -->
    <script type="module">
        // These imports are for the inline JavaScript functions above
        import { 
            signInWithEmailAndPassword, 
            createUserWithEmailAndPassword, 
            signOut, 
            onAuthStateChanged 
        } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-auth.js";
        
        import { 
            collection, 
            addDoc, 
            getDocs 
        } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-firestore.js";
        
        import { 
            ref, 
            uploadBytes, 
            getDownloadURL 
        } from "https://www.gstatic.com/firebasejs/9.22.2/firebase-storage.js";
        
        // Make these functions available globally
        window.signInWithEmailAndPassword = signInWithEmailAndPassword;
        window.createUserWithEmailAndPassword = createUserWithEmailAndPassword;
        window.signOut = signOut;
        window.onAuthStateChanged = onAuthStateChanged;
        window.collection = collection;
        window.addDoc = addDoc;
        window.getDocs = getDocs;
        window.ref = ref;
        window.uploadBytes = uploadBytes;
        window.getDownloadURL = getDownloadURL;
    </script>
</body>
</html>
