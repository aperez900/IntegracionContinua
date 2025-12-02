pipeline {
    agent any // Indica que el trabajo puede ejecutarse en cualquier agente

    stages {
        stage('Checkout') {
             steps {
                git branch: 'main',
                    url: 'https://github.com/aperez900/IntegracionContinua.git'
            }
        }
        
        stage('Build Docker Images') {
            steps {
                // 2. Construir la imagen del Backend
                sh 'docker build -t mi-backend:latest ./backend'
                // 3. Construir la imagen del Frontend
                sh 'docker build -t mi-frontend:latest ./frontend'
            }
        }

        stage('Run Tests') {
            steps {
                // 4. Ejecutar pruebas unitarias (ejemplo)
                sh 'docker-compose run backend python manage.py test' 
            }
        }
        
        stage('Deploy') {
            steps {
                // 5. Despliegue usando Docker Compose
                sh 'docker-compose up -d'
                // Nota: Esto asume que Docker y Jenkins están en el mismo host o Jenkins tiene acceso al Docker daemon.
            }
        }
    }
}