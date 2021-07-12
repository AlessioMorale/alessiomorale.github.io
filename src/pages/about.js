import React from "react"
import { graphql, StaticQuery } from "gatsby"
import Img from "gatsby-image"

import Layout from "../components/layout"
import SEO from "../components/seo"

import "../utils/normalize.css"
import "../utils/css/screen.css"

const AboutPage = ({ data }, location) => {
  const siteTitle = data.site.siteMetadata.title

  return (
    <Layout title={siteTitle}>
      <SEO
        title="About"
        keywords={[
          `blog`,
          `robotics`,
          `ROS`,
          `electronics`,
          `3D printing`,
          `mechanics`,
        ]}
      />

      <article className="post-content page-template no-image">
        <div className="post-content-body">
          <h2 id="clean-minimal-and-deeply-customisable-london-is-a-theme-made-for-people-who-appreciate-simple-lines-">
            Alessio Morale
          </h2>
          <p>
            Drones, robotics and electronics enthusiast, software engineer,
            inline skater.
          </p>
          <figure className="kg-card kg-image-card">
            <Img
              fluid={data.benchAccounting.childImageSharp.fluid}
              className="kg-image"
            />
            <figcaption>me :)</figcaption>
          </figure>
          <h3 id="dynamic-styles">Alessio Morale</h3>
          <p>
            Drones, robotics and electronics enthusiast, software engineer,
            inline skater..
          </p>
          <p>
            Software engineering and electronics are my hobbies since forever.
            Add to them an insane willingness to know how stuff works.
          </p>
          <p>
            In 2010 I discovered by chance the world of multirotor and UAVs.
            Initially, they just were simple Arduino based projects, but soon
            moved to more advanced platforms.
          </p>
          <p>
            At the beginning of 2012, I started collaborating with the OpenPilot
            project and later, in 2015, co-founded with several of its former
            developers, the LibrePilot project (www.librepilot.org) as firmware
            and architecture lead.
          </p>
          <p>
            Recently I'm interested in several other topics, including mobile
            robotics, <a href="https://www.ros.org">ROS</a>, products design and
            3d printing.
          </p>
          <p>
            Some of the projects I'm currently working on are{" "}
            <a href="/slammer">Slammer</a>, a rover robot and{" "}
            <a href="/unav2">uNav2</a>, an advanced motor control board for
            robots
          </p>

          <div className="site-head-right">
            <div className="social-links">
              <a
                href="https://www.linkedin.com/in/alessiomorale/"
                title="LinkedIn"
                target="_blank"
                rel="noopener noreferrer"
              >
                LinkedIn
              </a>
              <a
                href="https://twitter.com/alessiomorale"
                title="Twitter"
                target="_blank"
                rel="noopener noreferrer"
              >
                Twitter
              </a>
              <a
                href="https://github.com/AlessioMorale"
                title="GitHub"
                target="_blank"
                rel="noopener noreferrer"
              >
                GitHub
              </a>
            </div>
          </div>
        </div>
      </article>
    </Layout>
  )
}

const indexQuery = graphql`
  query {
    site {
      siteMetadata {
        title
      }
    }
    benchAccounting: file(relativePath: { eq: "header_icon.jpg" }) {
      childImageSharp {
        fluid(maxWidth: 1360) {
          ...GatsbyImageSharpFluid
        }
      }
    }
  }
`

export default props => (
  <StaticQuery
    query={indexQuery}
    render={data => (
      <AboutPage location={props.location} data={data} {...props} />
    )}
  />
)
