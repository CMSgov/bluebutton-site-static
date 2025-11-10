#!/usr/bin/env groovy

// Send a message to Slack
def slackNotify(message, status='unknown', channel='blue-button-api-alert') {
  switch (status) {
    case 'good':
      slack_color = 'good'
      break
    case 'bad':
      slack_color = 'danger'
      break
    default:
      slack_color = null
      break
  }

  withCredentials([string(credentialsId: 'bb2-slack-token', variable: 'slack_token')]) {
    if (env.DISABLE_SLACK_ALERTS != 'true') {
      slackSend message: "${message}\n${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)",
        color: slack_color,
        failOnError: false,
        teamDomain: 'cmsgov',
        channel: channel,
        token: slack_token
    }
  }
}

return this